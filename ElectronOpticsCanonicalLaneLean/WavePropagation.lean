import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectronOpticsCanonicalLaneLean.ElectronOpticsFoundation

/-!
# Wave Propagation Package

Models wave propagation in electron optics: scalar diffraction, Fresnel and Fraunhofer approximations, and transfer functions.
-/

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure WavePropagationPackage (F : EMFieldConfig) where
  wavelength : Type u
  propagationMedium : Type v
  scalarDiffractionIntegral : Prop
  fresnelApproximation : Prop
  fraunhoferApproximation : Prop
  transferFunction : Prop

structure WavePropagationEvidence {F : EMFieldConfig} (P : WavePropagationPackage F) where
  scalarDiffractionIntegralClosed : P.scalarDiffractionIntegral
  fresnelApproximationClosed : P.fresnelApproximation
  fraunhoferApproximationClosed : P.fraunhoferApproximation
  transferFunctionClosed : P.transferFunction

def WavePropagationClosed {F : EMFieldConfig} (P : WavePropagationPackage F) : Prop :=
  P.scalarDiffractionIntegral ∧ P.fresnelApproximation ∧
  P.fraunhoferApproximation ∧ P.transferFunction

theorem wave_propagation_closed_from_evidence
    {F : EMFieldConfig} (P : WavePropagationPackage F)
    (E : WavePropagationEvidence P) : WavePropagationClosed P := by
  exact And.intro E.scalarDiffractionIntegralClosed
    (And.intro E.fresnelApproximationClosed
      (And.intro E.fraunhoferApproximationClosed E.transferFunctionClosed))

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse