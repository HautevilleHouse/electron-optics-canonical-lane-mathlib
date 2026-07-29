import canonicalLaneMathlib.PerelmanAnalyticProof

/-!
# Electron Optics Analytic Evidence Terms
-/

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure MaxwellEquationEvidenceTerms {M : MaxwellEquationPackage}
    (C : MaxwellEquationAnalyticCertificate M) where
  gaussLaw : C.gaussLaw
  faradayLaw : C.faradayLaw
  ampereMaxwellLaw : C.ampereMaxwellLaw
  poissonEquation : C.poissonEquation
  maxwellClosed : MaxwellEquationClosed M

def MaxwellEquationAnalyticCertificate.evidenceTerms {M : MaxwellEquationPackage}
    (C : MaxwellEquationAnalyticCertificate M) : MaxwellEquationEvidenceTerms C :=
  { gaussLaw := C.gaussLawClosed
    faradayLaw := C.faradayLawClosed
    ampereMaxwellLaw := C.ampereMaxwellLawClosed
    poissonEquation := C.poissonEquationClosed
    maxwellClosed := maxwell_equation_closed_from_evidence M C.maxwellEvidence
  }

structure LensEquationEvidenceTerms {L : LensPackage}
    (C : LensAnalyticCertificate L) where
  thinLensEquation : C.thinLensEquation
  lensmakerEquation : C.lensmakerEquation
  aberrationCoefficient : C.aberrationCoefficient
  lensClosed : LensEquationClosed L

def LensAnalyticCertificate.evidenceTerms {L : LensPackage}
    (C : LensAnalyticCertificate L) : LensEquationEvidenceTerms C :=
  { thinLensEquation := C.thinLensEquationClosed
    lensmakerEquation := C.lensmakerEquationClosed
    aberrationCoefficient := C.aberrationCoefficientClosed
    lensClosed := lens_equation_closed_from_evidence L C.lensEvidence
  }

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse