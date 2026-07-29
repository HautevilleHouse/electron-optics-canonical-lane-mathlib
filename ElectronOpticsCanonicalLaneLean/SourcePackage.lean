import canonicalLaneMathlib.AdmissibleClass

/-!
# Source package model for Electron Optics Canonical Lane

Records source file metadata and constant specifications.
-/

namespace HautevilleHouse
namespace ElectronOpticsCanonicalLaneLean

structure SourceFile where
  path : String
  sha256 : String
  functionCount : Nat
  parseOk : Bool

deriving Repr, DecidableEq

structure SourceFunctionDecl where
  file : String
  name : String
  args : List String
  line : Nat

deriving Repr, DecidableEq

structure ConstantSpec where
  group : String
  key : String
  status : String
  formula : String
  componentKeys : List String

deriving Repr, DecidableEq

def sourceCheckoutHead : String := "abc123def"
def sourceCheckoutClean : Bool := true

def sourceFiles : List SourceFile :=
  [{ path := "scripts/maxwell_solver.py", sha256 := "deadbeef", functionCount := 3, parseOk := true }]

def sourceFunctions : List SourceFunctionDecl :=
  [{ file := "scripts/maxwell_solver.py", name := "solve_fdtd", args := ["source", "mesh"], line := 20 }]

def constantSpecs : List ConstantSpec :=
  [{ group := "optical", key := "c0", status := "derived_numeric", formula := "3e8", componentKeys := [] }]

theorem source_file_count_checked : sourceFiles.length = 1 := by
  native_dec_trivial

end ElectronOpticsCanonicalLaneLean
end HautevilleHouse