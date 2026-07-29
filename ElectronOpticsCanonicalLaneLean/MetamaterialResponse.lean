import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectronOpticsCanonicalLaneLean.ElectronOpticsFoundation

/-!
# Metamaterial Response Package

Models the electromagnetic response of metamaterials: effective medium parameters, dispersion relations, and singularities.
-/

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure MetamaterialResponsePackage (F : EMFieldConfig) where
  effectivePermittivity : Type u
  effectivePermeability : Type v
  dispersionRelation : Prop
  resonanceSingularity : Prop
  negativeIndexCondition : Prop

structure MetamaterialResponseEvidence {F : EMFieldConfig}
    (M : MetamaterialResponsePackage F) where
  dispersionRelationClosed : M.dispersionRelation
  resonanceSingularityClosed : M.resonanceSingularity
  negativeIndexConditionClosed : M.negativeIndexCondition

def MetamaterialResponseClosed {F : EMFieldConfig}
    (M : MetamaterialResponsePackage F) : Prop :=
  M.dispersionRelation ∧ M.resonanceSingularity ∧ M.negativeIndexCondition

theorem metamaterial_response_closed_from_evidence
    {F : EMFieldConfig} (M : MetamaterialResponsePackage F)
    (E : MetamaterialResponseEvidence M) : MetamaterialResponseClosed M := by
  exact And.intro E.dispersionRelationClosed
    (And.intro E.resonanceSingularityClosed E.negativeIndexConditionClosed)

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse