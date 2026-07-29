import canonicalLaneMathlib.AdmissibleClass

/-!
# Source dependency model for Electron Optics Canonical Lane

Records the source-level dependencies (scripts, modules) used in the electron optics formalization.
-/

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure SourceImportDependency where
  file : String
  kind : String
  module : String
  name : String
  alias : String
  level : Nat

deriving Repr, DecidableEq

structure SourcePathDependency where
  file : String
  name : String
  path : String
  role : String
  line : Nat

deriving Repr, DecidableEq

def sourceImportDependencies : List SourceImportDependency :=
  [{ file := "scripts/maxwell_solver.py", kind := "from_import", module := "numpy", name := "array", alias := "", level := 0 }]

def sourceRuntimeModules : List String :=
  ["numpy.array"]

def sourcePathDependencies : List SourcePathDependency :=
  [{ file := "scripts/maxwell_solver.py", name := "DEFAULT_PARM", path := "params/maxwell.json", role := "artifact", line := 15 }]

def sourceImportDependencyCount : Nat := 1

theorem source_import_dependency_count_checked : sourceImportDependencies.length = 1 := by
  native_dec_trivial

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse