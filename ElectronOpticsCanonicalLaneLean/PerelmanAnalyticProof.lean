import canonicalLaneMathlib.PerelmanRoute

/-!
# Electron Optics Analytic Proof Certificates
-/

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure MaxwellEquationAnalyticCertificate (M : MaxwellEquationPackage) where
  gaussLaw : Prop
  faradayLaw : Prop
  ampereMaxwellLaw : Prop
  poissonEquation : Prop
  gaussLawClosed : gaussLaw
  faradayLawClosed : faradayLaw
  ampereMaxwellLawClosed : ampereMaxwellLaw
  poissonEquationClosed : poissonEquation
  maxwellEvidence : MaxwellEquationEvidence M

def MaxwellEquationAnalyticCertificateClosed {M : MaxwellEquationPackage}
    (C : MaxwellEquationAnalyticCertificate M) : Prop :=
  C.gaussLaw ∧ C.faradayLaw ∧ C.ampereMaxwellLaw ∧ C.poissonEquation ∧ MaxwellEquationClosed M

theorem maxwell_equation_analytic_certificate_closed
    {M : MaxwellEquationPackage} (C : MaxwellEquationAnalyticCertificate M) :
    MaxwellEquationAnalyticCertificateClosed C := by
  exact And.intro C.gaussLawClosed
    (And.intro C.faradayLawClosed
      (And.intro C.ampereMaxwellLawClosed
        (And.intro C.poissonEquationClosed
          (maxwell_equation_closed_from_evidence M C.maxwellEvidence))))

structure LensAnalyticCertificate (L : LensPackage) where
  thinLensEquation : Prop
  lensmakerEquation : Prop
  aberrationCoefficient : Prop
  thinLensEquationClosed : thinLensEquation
  lensmakerEquationClosed : lensmakerEquation
  aberrationCoefficientClosed : aberrationCoefficient
  lensEvidence : LensEquationEvidence L

def LensAnalyticCertificateClosed {L : LensPackage}
    (C : LensAnalyticCertificate L) : Prop :=
  C.thinLensEquation ∧ C.lensmakerEquation ∧ C.aberrationCoefficient ∧ LensEquationClosed L

theorem lens_analytic_certificate_closed
    {L : LensPackage} (C : LensAnalyticCertificate L) :
    LensAnalyticCertificateClosed C := by
  exact And.intro C.thinLensEquationClosed
    (And.intro C.lensmakerEquationClosed
      (And.intro C.aberrationCoefficientClosed
        (lens_equation_closed_from_evidence L C.lensEvidence)))

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse