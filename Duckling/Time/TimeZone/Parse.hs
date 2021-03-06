-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.


{-# LANGUAGE OverloadedStrings #-}

module Duckling.Time.TimeZone.Parse
  ( parseTimezone
  ) where

import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HashMap
import Data.String
import Data.Text (Text)
import Data.Time (TimeZone(..))
import Prelude

-- `TimeZone` reads anything but only accepts timezones known
-- from the provided locale.
parseTimezone :: Text -> Maybe TimeZone
parseTimezone x = HashMap.lookup x tzs

tzs :: HashMap Text TimeZone
tzs = HashMap.fromList
  [ ( "YEKT", TimeZone 300 False "YEKT" )
  , ( "YEKST", TimeZone 360 True "YEKST" )
  , ( "YAKT", TimeZone 540 False "YAKT" )
  , ( "YAKST", TimeZone 600 True "YAKST" )
  , ( "WITA", TimeZone 480 False "WITA" )
  , ( "WIT", TimeZone 420 False "WIT" )
  , ( "WIB", TimeZone 420 False "WIB" )
  , ( "WGT", TimeZone (-180) False "WGT" )
  , ( "WGST", TimeZone (-120) True "WGST" )
  , ( "WFT", TimeZone 720 False "WFT" )
  , ( "WET", TimeZone 0 False "WET" )
  , ( "WEST", TimeZone 60 True "WEST" )
  , ( "WAT", TimeZone 60 False "WAT" )
  , ( "WAST", TimeZone 120 True "WAST" )
  , ( "VUT", TimeZone 660 False "VUT" )
  , ( "VLAT", TimeZone 660 False "VLAT" )
  , ( "VLAST", TimeZone 660 True "VLAST" )
  , ( "VET", TimeZone (-270) False "VET" )
  , ( "UZT", TimeZone 300 False "UZT" )
  , ( "UYT", TimeZone (-180) False "UYT" )
  , ( "UYST", TimeZone (-120) True "UYST" )
  , ( "UTC", TimeZone 0 False "UTC" )
  , ( "ULAT", TimeZone 480 False "ULAT" )
  , ( "TVT", TimeZone 720 False "TVT" )
  , ( "TMT", TimeZone 300 False "TMT" )
  , ( "TLT", TimeZone 540 False "TLT" )
  , ( "TKT", TimeZone 780 False "TKT" )
  , ( "TJT", TimeZone 300 False "TJT" )
  , ( "TFT", TimeZone 300 False "TFT" )
  , ( "TAHT", TimeZone (-600) False "TAHT" )
  , ( "SST", TimeZone (-660) False "SST" )
  , ( "SRT", TimeZone (-180) False "SRT" )
  , ( "SGT", TimeZone 480 False "SGT" )
  , ( "SCT", TimeZone 240 False "SCT" )
  , ( "SBT", TimeZone 660 False "SBT" )
  , ( "SAST", TimeZone 120 False "SAST" )
  , ( "SAMT", TimeZone 300 False "SAMT" )
  , ( "RET", TimeZone 240 False "RET" )
  , ( "PYT", TimeZone (-240) False "PYT" )
  , ( "PYST", TimeZone (-180) True "PYST" )
  , ( "PWT", TimeZone (-420) True "PWT" )
  , ( "PST", TimeZone (-480) False "PST" )
  , ( "PONT", TimeZone 660 False "PONT" )
  , ( "PMST", TimeZone (-180) False "PMST" )
  , ( "PMDT", TimeZone (-120) True "PMDT" )
  , ( "PKT", TimeZone 300 False "PKT" )
  , ( "PHT", TimeZone 480 False "PHT" )
  , ( "PHOT", TimeZone 780 False "PHOT" )
  , ( "PGT", TimeZone 600 False "PGT" )
  , ( "PETT", TimeZone 720 False "PETT" )
  , ( "PETST", TimeZone 720 True "PETST" )
  , ( "PET", TimeZone (-300) False "PET" )
  , ( "PDT", TimeZone (-420) False "PDT" )
  , ( "OMST", TimeZone 360 False "OMST" )
  , ( "OMSST", TimeZone 420 True "OMSST" )
  , ( "NZST", TimeZone 720 False "NZST" )
  , ( "NZDT", TimeZone 780 False "NZDT" )
  , ( "NUT", TimeZone (-660) False "NUT" )
  , ( "NST", TimeZone (-660) False "NST" )
  , ( "NPT", TimeZone (-600) True "NPT" )
  , ( "NOVT", TimeZone 360 False "NOVT" )
  , ( "NOVST", TimeZone 420 True "NOVST" )
  , ( "NFT", TimeZone 690 False "NFT" )
  , ( "NDT", TimeZone (-150) True "NDT" )
  , ( "NCT", TimeZone 660 False "NCT" )
  , ( "MYT", TimeZone 480 False "MYT" )
  , ( "MVT", TimeZone 300 False "MVT" )
  , ( "MUT", TimeZone 240 False "MUT" )
  , ( "MST", TimeZone (-420) False "MST" )
  , ( "MSK", TimeZone 180 False "MSK" )
  , ( "MSD", TimeZone 240 True "MSD" )
  , ( "MMT", TimeZone 390 False "MMT" )
  , ( "MHT", TimeZone 720 False "MHT" )
  , ( "MDT", TimeZone (-360) True "MDT" )
  , ( "MAWT", TimeZone 300 False "MAWT" )
  , ( "MART", TimeZone (-570) False "MART" )
  , ( "MAGT", TimeZone 600 False "MAGT" )
  , ( "MAGST", TimeZone 720 True "MAGST" )
  , ( "LINT", TimeZone 840 False "LINT" )
  , ( "LHST", TimeZone 630 False "LHST" )
  , ( "LHDT", TimeZone 660 True "LHDT" )
  , ( "KUYT", TimeZone 180 False "KUYT" )
  , ( "KST", TimeZone 540 False "KST" )
  , ( "KRAT", TimeZone 420 False "KRAT" )
  , ( "KRAST", TimeZone 480 True "KRAST" )
  , ( "KGT", TimeZone 360 False "KGT" )
  , ( "JST", TimeZone 540 False "JST" )
  , ( "IST", TimeZone 330 False "IST" )
  , ( "IRST", TimeZone 210 False "IRST" )
  , ( "IRKT", TimeZone 480 False "IRKT" )
  , ( "IRKST", TimeZone 540 True "IRKST" )
  , ( "IRDT", TimeZone 270 True "IRDT" )
  , ( "IOT", TimeZone 360 False "IOT" )
  , ( "IDT", TimeZone 180 True "IDT" )
  , ( "ICT", TimeZone 420 False "ICT" )
  , ( "HOVT", TimeZone 420 False "HOVT" )
  , ( "HKT", TimeZone 480 False "HKT" )
  , ( "GYT", TimeZone (-240) False "GYT" )
  , ( "GST", TimeZone 240 False "GST" )
  , ( "GMT", TimeZone 0 False "GMT" )
  , ( "GILT", TimeZone 720 False "GILT" )
  , ( "GFT", TimeZone (-180) False "GFT" )
  , ( "GET", TimeZone 240 False "GET" )
  , ( "GAMT", TimeZone (-540) False "GAMT" )
  , ( "GALT", TimeZone (-360) False "GALT" )
  , ( "FNT", TimeZone (-120) False "FNT" )
  , ( "FKT", TimeZone (-240) False "FKT" )
  , ( "FKST", TimeZone (-180) False "FKST" )
  , ( "FJT", TimeZone 720 False "FJT" )
  , ( "FJST", TimeZone 780 True "FJST" )
  , ( "EST", TimeZone (-300) False "EST" )
  , ( "EGT", TimeZone (-60) False "EGT" )
  , ( "EGST", TimeZone 0 True "EGST" )
  , ( "EET", TimeZone 120 False "EET" )
  , ( "EEST", TimeZone 180 True "EEST" )
  , ( "EDT", TimeZone (-240) True "EDT" )
  , ( "ECT", TimeZone (-300) False "ECT" )
  , ( "EAT", TimeZone 180 False "EAT" )
  , ( "EAST", TimeZone (-300) False "EAST" )
  , ( "EASST", TimeZone (-300) True "EASST" )
  , ( "DAVT", TimeZone 420 False "DAVT" )
  , ( "ChST", TimeZone 600 False "ChST" )
  , ( "CXT", TimeZone 420 False "CXT" )
  , ( "CVT", TimeZone (-60) False "CVT" )
  , ( "CST", TimeZone (-360) False "CST" )
  , ( "COT", TimeZone (-300) False "COT" )
  , ( "CLT", TimeZone (-180) False "CLT" )
  , ( "CLST", TimeZone (-180) True "CLST" )
  , ( "CKT", TimeZone (-600) False "CKT" )
  , ( "CHAST", TimeZone 765 False "CHAST" )
  , ( "CHADT", TimeZone 825 True "CHADT" )
  , ( "CET", TimeZone 60 False "CET" )
  , ( "CEST", TimeZone 120 True "CEST" )
  , ( "CDT", TimeZone (-300) True "CDT" )
  , ( "CCT", TimeZone 390 False "CCT" )
  , ( "CAT", TimeZone 120 False "CAT" )
  , ( "CAST", TimeZone 180 True "CAST" )
  , ( "BTT", TimeZone 360 False "BTT" )
  , ( "BST", TimeZone 60 False "BST" )
  , ( "BRT", TimeZone (-180) False "BRT" )
  , ( "BRST", TimeZone (-120) True "BRST" )
  , ( "BOT", TimeZone (-240) False "BOT" )
  , ( "BNT", TimeZone 480 False "BNT" )
  , ( "AZT", TimeZone 240 False "AZT" )
  , ( "AZST", TimeZone 300 True "AZST" )
  , ( "AZOT", TimeZone (-60) False "AZOT" )
  , ( "AZOST", TimeZone 0 True "AZOST" )
  , ( "AWST", TimeZone 480 False "AWST" )
  , ( "AWDT", TimeZone 540 True "AWDT" )
  , ( "AST", TimeZone (-240) False "AST" )
  , ( "ART", TimeZone (-180) False "ART" )
  , ( "AQTT", TimeZone 300 False "AQTT" )
  , ( "ANAT", TimeZone 720 False "ANAT" )
  , ( "ANAST", TimeZone 720 True "ANAST" )
  , ( "AMT", TimeZone 240 False "AMT" )
  , ( "AMST", TimeZone 300 True "AMST" )
  , ( "ALMT", TimeZone 360 False "ALMT" )
  , ( "AKST", TimeZone (-540) False "AKST" )
  , ( "AKDT", TimeZone (-480) True "AKDT" )
  , ( "AFT", TimeZone 270 False "AFT" )
  , ( "AEST", TimeZone 600 False "AEST" )
  , ( "AEDT", TimeZone 660 True "AEDT" )
  , ( "ADT", TimeZone (-180) True "ADT" )
  , ( "ACST", TimeZone 570 False "ACST" )
  , ( "ACDT", TimeZone 630 True "ACDT" )
  ]
