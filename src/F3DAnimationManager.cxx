#include "F3DAnimationManager.h"

#include "F3DLog.h"

#include <vtkCallbackCommand.h>
#include <vtkDoubleArray.h>
#include <vtkImporter.h>
#include <vtkProgressBarRepresentation.h>
#include <vtkRenderWindow.h>
#include <vtkRenderWindowInteractor.h>

//----------------------------------------------------------------------------
void F3DAnimationManager::Initialize(const F3DOptions& options, vtkImporter* importer, vtkRenderWindow* renWin)
{
  this->Importer = importer;
  if (!this->Importer)
  {
    F3DLog::Print(F3DLog::Severity::Error, "Importer is empty");
    return;
  }

  this->RenderWindow = renWin;
  if (!this->RenderWindow)
  {
    F3DLog::Print(F3DLog::Severity::Error, "RenderWindow is empty");
    return;
  }

  // This can be -1 if animation support is not implemented in the importer
  int availAnimations = this->Importer->GetNumberOfAnimations();

  if (availAnimations > 0)
  {
    this->ProgressWidget = vtkSmartPointer<vtkProgressBarWidget>::New();
    this->ProgressWidget->SetInteractor(renWin->GetInteractor());

    vtkProgressBarRepresentation* progressRep =
      vtkProgressBarRepresentation::SafeDownCast(this->ProgressWidget->GetRepresentation());
    progressRep->SetProgressRate(0.0);
    progressRep->ProportionalResizeOff();
    progressRep->SetPosition(0.0, 0.0);
    progressRep->SetPosition2(1.0, 0.0);
    progressRep->SetMinimumSize(0, 5);
    progressRep->SetProgressBarColor(1, 0, 0);
    progressRep->DrawBackgroundOff();
    progressRep->DragableOff();
    progressRep->SetShowBorderToOff();

#if VTK_VERSION_NUMBER >= VTK_VERSION_CHECK(9, 0, 20201027)
    progressRep->DrawFrameOff();
    progressRep->SetPadding(0.0, 0.0);
#endif

    this->ProgressWidget->On();
  }
  else
  {
    this->ProgressWidget = nullptr;
  }

  if (options.Verbose || options.NoRender)
  {
    if (availAnimations <= 0)
    {
      F3DLog::Print(F3DLog::Severity::Info, "No animations available in this file");
    }
    else
    {
      F3DLog::Print(F3DLog::Severity::Info, "Animations available in this file are:");
    }
    for (int i = 0; i < this->Importer->GetNumberOfAnimations(); i++)
    {
      F3DLog::Print(F3DLog::Severity::Info, i, ": ", this->Importer->GetAnimationName(i));
    }
    F3DLog::Print(F3DLog::Severity::Info, "\n");

  }

  if (options.AnimationIndex >= 0)
  {
    if (availAnimations > 0 && options.AnimationIndex >= availAnimations)
    {
      F3DLog::Print(F3DLog::Severity::Warning,
        "Specified animation index is greater than the highest possible animation index, enabling all animations.");
    }
    else if (availAnimations <= 0)
    {
      F3DLog::Print(F3DLog::Severity::Warning,
        "An animation index has been specified but there are no animations available.");
    }
  }
  if (options.AnimationIndex <= -1 || options.AnimationIndex >= availAnimations)
  {
    for (int i = 0; i < availAnimations; i++)
    {
      this->Importer->EnableAnimation(i);
    }
  }
  else
  {
    this->Importer->EnableAnimation(options.AnimationIndex);
  }

  this->TimeSteps.clear();
  this->TimeRange[0] = 0.0;
  this->TimeRange[1] = 0.0;

  vtkIdType nbAnims = this->Importer->GetNumberOfAnimations();
  for (vtkIdType animIndex = 0; animIndex < nbAnims; animIndex++)
  {
    if (this->Importer->IsAnimationEnabled(animIndex))
    {
      int nbTimeSteps;
      vtkNew<vtkDoubleArray> timeSteps;

#if VTK_VERSION_NUMBER >= VTK_VERSION_CHECK(9, 0, 20201016)
      this->Importer->GetTemporalInformation(
        animIndex, this->FrameRate, nbTimeSteps, this->TimeRange, timeSteps);
#else
      this->Importer->GetTemporalInformation(
        animIndex, nbTimeSteps, this->TimeRange, timeSteps);
#endif

      for (vtkIdType i = 0; i < timeSteps->GetNumberOfTuples(); i++)
      {
        this->TimeSteps.insert(timeSteps->GetValue(i));
      }
    }
  }

  this->CurrentTimeStep = std::begin(this->TimeSteps);
}

//----------------------------------------------------------------------------
void F3DAnimationManager::Finalize()
{
  if (this->IsPlaying())
  {
    this->ToggleAnimation();
  }
  this->ProgressWidget = nullptr;
}

//----------------------------------------------------------------------------
void F3DAnimationManager::ToggleAnimation()
{
  if (this->Importer && this->RenderWindow)
  {
    this->Playing = !this->Playing;

    vtkRenderWindowInteractor* interactor = this->RenderWindow->GetInteractor();
    interactor->RemoveObservers(vtkCommand::TimerEvent);
    interactor->DestroyTimer();

    if (this->Playing)
    {
      vtkNew<vtkCallbackCommand> tickCallback;
      tickCallback->SetClientData(this);
      tickCallback->SetCallback([](vtkObject*, unsigned long, void* clientData, void*) {
        F3DAnimationManager* animMgr = static_cast<F3DAnimationManager*>(clientData);
        animMgr->Tick();
      });
      interactor->AddObserver(vtkCommand::TimerEvent, tickCallback);
      interactor->CreateRepeatingTimer(1000.0 / this->FrameRate);
    }
  }
}

//----------------------------------------------------------------------------
void F3DAnimationManager::Tick()
{
  if (this->TimeSteps.size() > 0)
  {
    vtkProgressBarRepresentation* progressRep =
      vtkProgressBarRepresentation::SafeDownCast(this->ProgressWidget->GetRepresentation());
    progressRep->SetProgressRate(std::distance(std::begin(this->TimeSteps), this->CurrentTimeStep) /
      static_cast<double>(this->TimeSteps.size() - 1));

    this->Importer->UpdateTimeStep(*this->CurrentTimeStep);
    this->RenderWindow->Render();

    this->CurrentTimeStep++;

    // repeat
    if (this->CurrentTimeStep == std::end(this->TimeSteps))
    {
      this->CurrentTimeStep = std::begin(this->TimeSteps);
    }
  }
}

//----------------------------------------------------------------------------
double F3DAnimationManager::GetAnimationProgress()
{
  if (this->TimeSteps.size() > 1)
  {
    int idx = std::distance(std::begin(this->TimeSteps), this->CurrentTimeStep);
    return idx / static_cast<double>(this->TimeSteps.size() - 1);
  }
  return 0.0;
}
