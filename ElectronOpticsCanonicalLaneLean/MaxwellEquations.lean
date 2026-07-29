import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure MaxwellEquationsPackage where
  electricFieldWaveEquation : Prop
  magneticFieldWaveEquation : Prop
  gaussLawElectric : Prop
  gaussLawMagnetic : Prop
  faradayLaw : Prop
  ampereLaw : Prop

structure MaxwellEquationsEvidence (M : MaxwellEquationsPackage) where
  electricFieldWaveEquationClosed : M.electricFieldWaveEquation
  magneticFieldWaveEquationClosed : M.magneticFieldWaveEquation
  gaussLawElectricClosed : M.gaussLawElectric
  gaussLawMagneticClosed : M.gaussLawMagnetic
  faradayLawClosed : M.faradayLaw
  ampereLawClosed : M.ampereLaw

def MaxwellEquationsClosed (M : MaxwellEquationsPackage) : Prop :=
  M.electricFieldWaveEquation ∧ M.magneticFieldWaveEquation ∧
  M.gaussLawElectric ∧ M.gaussLawMagnetic ∧
  M.faradayLaw ∧ M.ampereLaw

theorem maxwell_equations_closed_from_evidence (M : MaxwellEquationsPackage)
    (E : MaxwellEquationsEvidence M) : MaxwellEquationsClosed M := by
  exact And.intro E.electricFieldWaveEquationClosed
    (And.intro E.magneticFieldWaveEquationClosed
      (And.intro E.gaussLawElectricClosed
        (And.intro E.gaussLawMagneticClosed
          (And.intro E.faradayLawClosed E.ampereLawClosed))))

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse