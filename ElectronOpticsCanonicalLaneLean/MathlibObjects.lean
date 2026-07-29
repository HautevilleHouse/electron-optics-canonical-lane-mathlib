import canonicalLaneMathlib.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ElectronOpticsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ElectronOpticsAdmittedObject where
  space : ElectronOpticsSpace
  beamPresent : Prop
  lensSystem : Prop
  fieldConfiguration : Prop
  aberrationCorrected : Prop
  conclusion : aberrationCorrected

structure ElectronOpticsEndgameState where
  object : ElectronOpticsAdmittedObject

def ElectronOpticsWitnessClosed (O : ElectronOpticsAdmittedObject) : Prop :=
  O.aberrationCorrected

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse