import ElectronOpticsCanonicalLaneLean.AdmissibleClass
import ElectronOpticsCanonicalLaneLean.BridgeLemmas
import ElectronOpticsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

def ConstrainedElectronOpticsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_electron_optics_endgame (A : AdmissibleClass) :
    ConstrainedElectronOpticsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse