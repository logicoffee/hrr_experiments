module DB where

import           Database.HDBC.PostgreSQL (Connection, connectPostgreSQL)

connectPG :: IO Connection
connectPG = connectPostgreSQL $
    "host=localhost"
    ++ " port=5432"
    ++ " user=user"
    ++ " dbname=test"
    ++ " password=password"
    ++ " sslmode=disable"
