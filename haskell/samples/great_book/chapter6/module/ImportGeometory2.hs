import qualified Geometory.Sphere as Sphere
import qualified Geometory.Cuboid as Cuboid
import qualified Geometory.Cube as Cube

main :: IO ()
main = do
        print $ Sphere.volume (2.0 * pi)
        print $ Cuboid.volume 2 3 4
        print $ Cube.volume 5
