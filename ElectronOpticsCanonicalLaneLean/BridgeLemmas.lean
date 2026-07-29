import canonicalLaneMathlib.AdmissibleClass
import ElectronOpticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ElectronOpticsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse