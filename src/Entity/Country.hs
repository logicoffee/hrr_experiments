{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}

module Entity.Country where

import           Database.HDBC.Query.TH          (defineTableFromDB)
import           Database.HDBC.Record.Insert     (runInsert)
import           Database.HDBC.Record.Query      (runQuery')
import           Database.HDBC.Schema.PostgreSQL (driverPostgreSQL)
import           Database.Relational.Type        (insert, relationalQuery)
import           DB                              (connectPG)
import           GHC.Generics                    (Generic)

$(defineTableFromDB
    connectPG
    driverPostgreSQL
    "public"
    "country"
    [''Show, ''Generic])


testInsert :: IO Integer
testInsert = do
    conn <- connectPG
    runInsert conn (insert countryName')  "USA"

showAllCountries :: IO ()
showAllCountries = do
    conn <- connectPG
    countries <- runQuery' conn (relationalQuery country) ()
    mapM_ print countries
