module Paths_ATermLib (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [1,6], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/jkoppel/Library/Haskell/ghc-7.4.2/lib/ATermLib-1.6/bin"
libdir     = "/Users/jkoppel/Library/Haskell/ghc-7.4.2/lib/ATermLib-1.6/lib"
datadir    = "/Users/jkoppel/Library/Haskell/ghc-7.4.2/lib/ATermLib-1.6/share"
libexecdir = "/Users/jkoppel/Library/Haskell/ghc-7.4.2/lib/ATermLib-1.6/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "ATermLib_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ATermLib_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "ATermLib_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ATermLib_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
