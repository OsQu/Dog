module LibSpec (spec) where

import Test.Hspec
import Lib

spec :: Spec

spec = do
  describe "Lib module" $ do
    describe "someFunc" $ do
      it "Adds 5 to the parameter" $ do
        let value = someFunc 5
        value `shouldBe` 10

