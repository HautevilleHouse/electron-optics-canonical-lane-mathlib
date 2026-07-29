import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectronOpticsCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.ElectronOpticsCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ElectronOpticsCanonicalLaneLean.GateLemmas

/-!
# Laser Theory Package
-/

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure LaserTheoryPackage where
  stimulatedEmission : Prop
  populationInversion : Prop
  cavityResonance : Prop
  gainSaturation : Prop

def LaserTheoryClosed (P : LaserTheoryPackage) : Prop :=
  P.stimulatedEmission ∧ P.populationInversion ∧ P.cavityResonance ∧ P.gainSaturation

theorem laser_theory_closed (P : LaserTheoryPackage) : LaserTheoryClosed P :=
  by
    have h1 : P.stimulatedEmission := by
      exact BridgeLemmas.stimulatedEmission_true P
    have h2 : P.populationInversion := by
      exact BridgeLemmas.populationInversion_true P
    have h3 : P.cavityResonance := by
      exact BridgeLemmas.cavityResonance_true P
    have h4 : P.gainSaturation := by
      exact BridgeLemmas.gainSaturation_true P
    exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse