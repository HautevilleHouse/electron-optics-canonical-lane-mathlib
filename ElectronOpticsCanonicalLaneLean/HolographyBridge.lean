import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectronOpticsCanonicalLaneLean.ElectronOpticsObjects

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure HolographyPackage where
  referenceWave : Prop
  objectWave : Prop
  interferencePattern : Prop
  reconstruction : Prop

structure HolographyEvidence (H : HolographyPackage) where
  referenceWaveClosed : H.referenceWave
  objectWaveClosed : H.objectWave
  interferencePatternClosed : H.interferencePattern
  reconstructionClosed : H.reconstruction

def HolographyClosed (H : HolographyPackage) : Prop :=
  H.referenceWave ∧ H.objectWave ∧ H.interferencePattern ∧ H.reconstruction

theorem holography_closed_from_evidence (H : HolographyPackage) (E : HolographyEvidence H) : HolographyClosed H := by
  exact And.intro E.referenceWaveClosed
    (And.intro E.objectWaveClosed
      (And.intro E.interferencePatternClosed E.reconstructionClosed))

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse