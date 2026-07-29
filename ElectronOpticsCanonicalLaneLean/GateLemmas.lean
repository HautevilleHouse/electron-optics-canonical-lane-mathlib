import canonicalLaneMathlib.AdmissibleClass
import ElectronOpticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse