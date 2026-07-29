import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure DiffractionTheoryPackage where
  fresnelDiffraction : Prop
  fraunhoferDiffraction : Prop
  huygensFresnelPrinciple : Prop
  scalarDiffractionModel : Prop

structure DiffractionTheoryEvidence (D : DiffractionTheoryPackage) where
  fresnelDiffractionClosed : D.fresnelDiffraction
  fraunhoferDiffractionClosed : D.fraunhoferDiffraction
  huygensFresnelPrincipleClosed : D.huygensFresnelPrinciple
  scalarDiffractionModelClosed : D.scalarDiffractionModel

def DiffractionTheoryClosed (D : DiffractionTheoryPackage) : Prop :=
  D.fresnelDiffraction ∧ D.fraunhoferDiffraction ∧
  D.huygensFresnelPrinciple ∧ D.scalarDiffractionModel

theorem diffraction_theory_closed_from_evidence (D : DiffractionTheoryPackage)
    (E : DiffractionTheoryEvidence D) : DiffractionTheoryClosed D := by
  exact And.intro E.fresnelDiffractionClosed
    (And.intro E.fraunhoferDiffractionClosed
      (And.intro E.huygensFresnelPrincipleClosed E.scalarDiffractionModelClosed))

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse