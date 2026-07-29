import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectronOpticsCanonicalLaneLean.ElectronOpticsObjects

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure MaxwellPackage where
  timeHarmonicFields : Prop
  boundaryConditions : Prop
  materialResponse : Prop
  gaugeCondition : Prop

structure MaxwellEvidence (M : MaxwellPackage) where
  timeHarmonicFieldsClosed : M.timeHarmonicFields
  boundaryConditionsClosed : M.boundaryConditions
  materialResponseClosed : M.materialResponse
  gaugeConditionClosed : M.gaugeCondition

def MaxwellClosed (M : MaxwellPackage) : Prop :=
  M.timeHarmonicFields ∧ M.boundaryConditions ∧ M.materialResponse ∧ M.gaugeCondition

theorem maxwell_closed_from_evidence (M : MaxwellPackage) (E : MaxwellEvidence M) : MaxwellClosed M := by
  exact And.intro E.timeHarmonicFieldsClosed
    (And.intro E.boundaryConditionsClosed
      (And.intro E.materialResponseClosed E.gaugeConditionClosed))

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse