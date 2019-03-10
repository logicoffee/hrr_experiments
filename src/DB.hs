-- {-# LANGUAGE TemplateHaskell #-}
module DB where

import           Database.HDBC.PostgreSQL        (Connection, connectPostgreSQL)
-- import           Database.HDBC.Schema.Driver     (Driver, typeMap)
import           Database.HDBC.Schema.PostgreSQL (driverPostgreSQL)
import           System.Environment              (getEnv)
import           Text.Printf                     (printf)

connectPG :: IO Connection
connectPG = do
    host     <- getEnv "PG_HOST"
    port     <- getEnv "PG_PORT"
    user     <- getEnv "PG_USER"
    db_name  <- getEnv "PG_DB_NAME"
    password <- getEnv "PG_PASSWORD"
    connectPostgreSQL $
        printf "host=%s port=%s user= %s dbname=%s password=%s sslmode=disable"
            host port user db_name password

-- driverPG :: Driver Connection
-- driverPG = driverPostgreSQL { typeMap = [("integer", [t|Int|])] }

