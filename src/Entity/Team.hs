{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}

module Entity.Team where

import           Database.HDBC.Query.TH          (defineTableFromDB')
import           Database.HDBC.Schema.PostgreSQL (driverPostgreSQL)
import           DB                              (connectPG)
import           GHC.Generics                    (Generic)


$(defineTableFromDB'
    connectPG
    driverPostgreSQL
    "public"
    "team"
    [("id", [t|Int|])]
    [''Show, ''Generic])

