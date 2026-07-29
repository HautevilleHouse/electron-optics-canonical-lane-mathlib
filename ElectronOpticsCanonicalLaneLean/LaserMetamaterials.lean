import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectronOpticsCanonicalLaneLean.ElectronOpticsObjects

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure LaserPackage where
  gainMedium : Prop
  cavityResonance : Prop
  outputCoupling : Prop
  modeStability : Prop

structure MetamaterialPackage where
  negativeIndex : Prop
  subwavelengthResolution : Prop
  dispersionEngineered : Prop
  homogeneity : Prop

structure LaserMetamaterialEvidence (L : LaserPackage) (M : MetamaterialPackage) where
  laserClosed : LaserClosed L
  metamaterialClosed : MetamaterialClosed M

def LaserClosed (L : LaserPackage) : Prop :=
  L.gainMedium ∧ L.cavityResonance ∧ L.outputCoupling ∧ L.modeStability

def MetamaterialClosed (M : MetamaterialPackage) : Prop :=
  M.negativeIndex ∧ M.subwavelengthResolution ∧ M.dispersionEngineered ∧ M.homogeneity

theorem laser_closed_from_evidence (L : LaserPackage) (E : LaserMetamaterialEvidence L _) : LaserClosed L := by
  exact E.laserClosed

theorem metamaterial_closed_from_evidence (M : MetamaterialPackage) (E : LaserMetamaterialEvidence _ M) : MetamaterialClosed M := by
  exact E.metamaterialClosed

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse