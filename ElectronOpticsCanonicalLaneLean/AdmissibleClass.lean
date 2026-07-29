import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ElectronOpticsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ElectronOpticsAdmittedObject where
  space : ElectronOpticsSpace
  waveEquationSatisfied : Prop
  boundaryConditions : Prop
  coherenceModel : Type
  coherenceTopology : TopologicalSpace coherenceModel
  coherenceClosed : Prop
  conclusion : coherenceClosed

structure ElectronOpticsEndgameState where
  object : ElectronOpticsAdmittedObject

def ElectronOpticsWitnessClosed (O : ElectronOpticsAdmittedObject) : Prop :=
  O.coherenceClosed

structure AdmissibleClass where
  object : ElectronOpticsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ElectronOpticsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse