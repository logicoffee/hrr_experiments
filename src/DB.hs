-- {-# LANGUAGE TemplateHaskell #-}
module DB where

import           Database.HDBC.PostgreSQL        (Connection, connectPostgreSQL)
-- import           Database.HDBC.Schema.Driver     (Driver, typeMap)
import           Database.HDBC.Schema.PostgreSQL (driverPostgreSQL)

connectPG :: IO Connection
connectPG = connectPostgreSQL $
    "host=localhost"
    ++ " port=5432"
    ++ " user=user"
    ++ " dbname=test"
    ++ " password=password"
    ++ " sslmode=disable"

-- driverPG :: Driver Connection
-- driverPG = driverPostgreSQL { typeMap = [("integer", [t|Int|])] }

