import canonicalLaneMathlib.PerelmanEntropy

/-!
# Beam Collimation Package
-/

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure BeamCollimationPackage where
  emittanceLowerBound : Prop
  divergenceControl : Prop
  brightnessPreservation : Prop

structure BeamCollimationEvidence (N : BeamCollimationPackage) where
  emittanceLowerBoundClosed : N.emittanceLowerBound
  divergenceControlClosed : N.divergenceControl
  brightnessPreservationClosed : N.brightnessPreservation

def BeamCollimationClosed (N : BeamCollimationPackage) : Prop :=
  N.emittanceLowerBound ∧ N.divergenceControl ∧ N.brightnessPreservation

theorem beam_collimation_closed_from_evidence
    (N : BeamCollimationPackage) (E : BeamCollimationEvidence N) :
    BeamCollimationClosed N := by
  exact And.intro E.emittanceLowerBoundClosed
    (And.intro E.divergenceControlClosed E.brightnessPreservationClosed)

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse