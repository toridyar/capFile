CREATE TEMPORARY FUNCTION capitalize(str STRING) AS ((
  SELECT STRING_AGG(CONCAT(UPPER(SUBSTR(word, 1, 1)), LOWER(SUBSTR(word, 2))), ' ' ORDER BY pos)
  FROM UNNEST(SPLIT(str, ' ')) word WITH OFFSET pos
));
SELECT
  DISTINCT 'Y01K' AS Source,
  ROW_NUMBER() OVER(ORDER BY gst.guest_first_name) AS Id,
  CAST(CASE
    WHEN gst.titleGuest = 'Mr.' THEN '0001'
    WHEN gst.titleGuest = 'Mrs.' THEN '0002'
    WHEN gst.titleGuest = 'Miss' THEN '0005'
    ELSE CAST('' AS STRING)
  END AS STRING) AS Title,
  CAST('' AS STRING) AS Text,
  CASE
    WHEN gst.titleGuest = 'Dr.' THEN '0001'
    ELSE CAST('' AS STRING)
  END AS Academic_Title,
  CAST('' AS STRING) AS Name_Supplement,
  CAST('' AS STRING) AS Text1,
  CAST('' AS STRING) AS Suffix,
  CAST('' AS STRING) AS MI,
  capitalize(CAST(SUBSTR(REPLACE(REPLACE(gst.guest_first_name,'"',''),',',''),1,40)AS STRING)) AS Name_First,
  capitalize(CAST(SUBSTR(REPLACE(REPLACE(gst.guest_last_name,'"',''),',',''),1,40)AS STRING)) AS Name_Last,
  CAST('' AS STRING) AS Business_Partner,
  CAST('' AS STRING) AS MI_Forename,
  CAST('' AS STRING) AS Other_Last_Name,
  CAST('' AS STRING) AS Company,
  CAST('' AS STRING) AS Company_2,
  'E' AS LANG,
  CAST('' AS STRING) AS CO_Name,
  capitalize(CAST(SUBSTR(REPLACE(REPLACE(gst.street_addressGuest,'"',''),',',''),1,50)AS STRING)) AS Street,
  CAST('' AS STRING) AS Street2,
  CAST('' AS STRING) AS Street3,
  CAST('' AS STRING) AS Street4,
  CAST('' AS STRING) AS House_Number,
  CAST('' AS STRING) AS House_Number_Supplement,
  CAST(SUBSTR(REPLACE(REPLACE(gst.postal_codeGuest,'"',''),',',''),1,10)AS STRING) AS Post_Code1,
  capitalize(CAST(SUBSTR(REPLACE(REPLACE(gst.cityguest,'"',''),',',''),1,40)AS STRING)) AS City1,
  UPPER(REPLACE(REPLACE(gst.stateguest,'"',''),',','')) AS State,
  CAST('' AS STRING) AS Building,
  CAST('' AS STRING) AS Apt_Number,
  CAST('' AS STRING) AS Building_Floor,
  CAST (gst.guest_country AS STRING) AS Country,
  CAST('' AS STRING) AS PO_Box,
  CAST('' AS STRING) AS PO_Box_Postal_Code,
  CAST('' AS STRING) AS STreet5,
  CAST('' AS STRING) AS Other_City,
  CAST('' AS STRING) AS PO_Box_City,
  CAST('' AS STRING) AS Gender,
  CAST('' AS STRING) AS Marital_Status,
  CAST('' AS STRING) AS Birthdate,
  CAST('' AS STRING) AS Year_Of_Birth,
  CAST('' AS STRING) AS Year_Of_Birth1,
  CAST('' AS STRING) AS Occupation,
  CAST('' AS STRING) AS Phone,
  CAST('' AS STRING) AS Telephone_Extension,
  CAST('' AS STRING) AS Communication_Link_Notes,
  CAST('' AS STRING) AS Telephone_No,
  CAST('' AS STRING) AS Telephone_Ext,
  CAST('' AS STRING) AS Communication_Link_Notes1,  
  CAST(SUBSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(gst.phone_numberguest,'"',''),"-",""),".",""),"(",""),")",""),' ',''),1,10)AS STRING) AS Mobile_Phone,
  CAST('' AS STRING) AS Communication_Link_Notes2,
  CAST('' AS STRING) AS First_Mobile_Number,
  CAST('' AS STRING) AS Communication_Link_Notes3,
  CAST('' AS STRING) AS Telephone,
  CAST('' AS STRING) AS Telephone_Ext1,
  CAST('' AS STRING) AS Communication_Link_Notes4,
  CAST(SUBSTR(REPLACE(REPLACE(gst.guest_email,'"',''),',',''),1,50)AS STRING) AS SMTP_Addr1,
  CAST('' AS STRING) AS Communication_Link_Notes5,
  CAST('' AS STRING) AS Email,
  CAST('' AS STRING) AS Communication_Link_Notes6,
  CAST('' AS STRING) AS Communication_Method,
  CAST('' AS STRING) AS Reachable_From,
  CAST('' AS STRING) AS Reachable_Until,
  CAST('' AS STRING) AS PreferSalesDlr,
  CAST('' AS STRING) AS PreferSalesDlr1,
  CAST('' AS STRING) AS IncomeRange,
  CAST('' AS STRING) AS Commercia_Vehicle_Owner,
  CAST('' AS STRING) AS Medium,
  CAST('' AS STRING) AS ManufactureCodes,
  CAST('' AS STRING) AS ForeignVehicleModelCode,
  CAST('' AS STRING) AS ModelYear,
  CAST('' AS STRING) AS NextInspection,
  CAST('' AS STRING) AS ManCodes,
  CAST('' AS STRING) AS ForeignVehicleModel,
  CAST('' AS STRING) AS ModelYear1,
  CAST('' AS STRING) AS NextInspection1,
  CAST('' AS STRING) AS ManCode,
  CAST('' AS STRING) AS ForeignVehicleModel1,
  CAST('' AS STRING) AS ModelYear2,
  CAST('' AS STRING) AS NextInspection2,
  CAST('' AS STRING) AS PurchaseTimeframe,
  CAST('' AS STRING) AS CAR_PUR_MM,
  CAST('' AS STRING) AS CAR_PUR_JJJJ,
  CAST('' AS STRING) AS PrimaryInterest,
  CAST('' AS STRING) AS NewVehicle,
  CAST('' AS STRING) AS CPOVehicle,
  CAST('' AS STRING) AS VEHModel,
  CAST('' AS STRING) AS VEHModelType,
  CAST('' AS STRING) AS ModelTypeOfVehicle,
  CAST('' AS STRING) AS ModelTypeDescription,
  CAST('' AS STRING) AS BrochurePartNo,
  CAST('' AS STRING) AS BrochurePartNo1,
  CAST('' AS STRING) AS BrochurePartNo2,
  CAST('' AS STRING) AS BrochurePartNo3,
  CAST('' AS STRING) AS BrochurePartNo4,
  CAST('' AS STRING) AS InfoMaterialText,
  CAST('' AS STRING) AS Interest1,
  CAST('' AS STRING) AS Interest2,
  CAST('' AS STRING) AS Interest3,
  CAST('' AS STRING) AS DealerContactRequested,
  CAST('' AS STRING) AS TestDriveRequested,
  CAST('' AS STRING) AS CampaignID,
  CAST('' AS STRING) AS LeadGroup,
  CAST('' AS STRING) AS LeadOrigin,
  CAST('' AS STRING) AS BusPartnerNumber,
  'PCNA' AS Importer,
  CAST('' AS STRING) AS ManualScore,
  CAST('' AS STRING) AS Man_Score_Reason,
  CAST('' AS STRING) AS LeadDate,
  CAST('' AS STRING) AS LeadDescription,
  CAST('' AS STRING) AS VehicleMake,
  CAST('' AS STRING) AS VehicleModel,
  CAST('' AS STRING) AS Response,
  CAST('' AS STRING) AS PurchaseAmount,
  CAST('' AS STRING) AS Home_Work,
  CAST('' AS STRING) AS ClubMember,
  CAST('' AS STRING) AS ClubName,
  CAST('' AS STRING) AS YYYY,
  CAST('' AS STRING) AS Hobbies,
  CAST('' AS STRING) AS Industry,
  CAST('' AS STRING) AS IndustrySector,
  CAST('' AS STRING) AS AgreedDateProtection,
  CAST('' AS STRING) AS MailBlock,
  CAST('' AS STRING) AS PhoneBlock,
  CAST('' AS STRING) AS EmailBlock,
  CAST('' AS STRING) AS Faxblock,
  CAST('' AS STRING) AS AppliedforENewsletter,
  CAST('' AS STRING) AS Comment,
  'YM04' AS CON_PROCESS_TYPE,
  CAST('' AS STRING) AS ConReasonCode,
  CAST(SUBSTR(REPLACE(CONCAT(SUBSTR(ct.name,1,30),' - ',CASE
  WHEN gst.company_id=91080 THEN 'PEC ATL'
  WHEN gst.company_id=91081 THEN 'PEC LA'
  WHEN gst.company_id=91082 THEN 'PTX'
  ELSE CAST('' AS STRING)
  END),'"',''),1,40)AS STRING) AS CON_DESCRIPTION,
  UPPER(ifnull(itm.sku,prod.sku)) AS CON_CAMPAIGN_ID,
  'E0013' AS CON_STATUS,
  CAST('' AS STRING) AS CON_VIN,
  CAST('' AS STRING) AS CON_PLAN_DATE,
  CAST('' AS STRING) AS CON_PLAN_TIME,
  bk.start_date AS CON_ACTUAL_DATE,
  CAST('' AS STRING) AS CON_ACTUAL_TIME,
  CONCAT('Customer participated at ',CASE
                                       WHEN gst.company_id=91080 THEN 'PEC ATL'
                                       WHEN gst.company_id=91081 THEN 'PEC LA'
                                       WHEN gst.company_id=91082 THEN 'PTX'
                                       ELSE CAST('' AS STRING)
                                     END,' for ',bk.start_date,' [#',CAST(bk.booking_id AS STRING),']') AS NOTES,
  CAST('' AS STRING) AS VIN1,
  CAST('' AS STRING) AS EnergyType1,
  CAST('' AS STRING) AS BodyType1,
  CAST('' AS STRING) AS TransmType1,
 CAST('' AS STRING) AS TaxClass1,
  CAST('' AS STRING) AS LicensePlate1,
  CAST('' AS STRING) AS OwnerRegDate1,
  CAST('' AS STRING) AS FirstRegDate1,
  CAST('' AS STRING) AS OwnerEndDate1,
  CAST('' AS STRING) AS AnticipChage1,
  CAST('' AS STRING) AS ModelVersion1,
  CAST('' AS STRING) AS Mileage1,
  CAST('' AS STRING) AS PurchaseDate1,
  CAST('' AS STRING) AS PurchaseType1,
  CAST('' AS STRING) AS VehCategory1,
  CAST('' AS STRING) AS VehReplacement1,
  CAST('' AS STRING) AS VIN2,
  CAST('' AS STRING) AS EnergyType2,
  CAST('' AS STRING) AS BodyType2,
  CAST('' AS STRING) AS TransmType2,
  CAST('' AS STRING) AS TaxClass2,
  CAST('' AS STRING) AS LicensePlate2,
  CAST('' AS STRING) AS OwnerRegDate2,
  CAST('' AS STRING) AS FirstRegDate2,
  CAST('' AS STRING) AS OwnerEndDate2,
  CAST('' AS STRING) AS AnticipChage2,
  CAST('' AS STRING) AS ModelVersion2,
  CAST('' AS STRING) AS Mileage2,
  CAST('' AS STRING) AS PurchaseDate2,
  CAST('' AS STRING) AS PurchaseType2,
  CAST('' AS STRING) AS VehCategory2,
  CAST('' AS STRING) AS VehReplacement2,
  CAST('' AS STRING) AS VIN3,
  CAST('' AS STRING) AS EnergyType3,
  CAST('' AS STRING) AS BodyType3,
  CAST('' AS STRING) AS TransmType3,
  CAST('' AS STRING) AS TaxClass3,
  CAST('' AS STRING) AS LicensePlate3,
  CAST('' AS STRING) AS OwnerRegDate3,
  CAST('' AS STRING) AS FirstRegDate3,
  CAST('' AS STRING) AS OwnerEndDate3,
  CAST('' AS STRING) AS AnticipChage3,
  CAST('' AS STRING) AS ModelVersion3,
  CAST('' AS STRING) AS Mileage3,
  CAST('' AS STRING) AS PurchaseDate3,
  CAST('' AS STRING) AS PurchaseType3,
  CAST('' AS STRING) AS VehCategory3,
  CAST('' AS STRING) AS VehReplacement3,
  CAST('' AS STRING) AS YChrstSub,
  CAST('' AS STRING) AS YChrstSubUntil,
  CAST('' AS STRING) AS YChrstIDType,
  CAST('' AS STRING) AS YChrstComp,
  CAST('' AS STRING) AS YChrstComopRea,
  CAST('' AS STRING) AS YChrstComplUnt,
  CAST('' AS STRING) AS LeadVinInt,
  CAST('' AS STRING) AS ActvtTdid
FROM `cf-moxie-data.core.guest` gst
  inner join `cf-moxie-data.core.company` cmp ON gst.company_id  = cmp.company_id
  Full Outer Join `cf-moxie-data.core.item` itm 
    On gst.item_id = itm.item_id
    AND gst.company_id = itm.company_id
  Full Outer Join `cf-moxie-data.core.product` prod
    on gst.item_id = prod.product_id
    AND gst.company_id = prod.company_id
  Inner Join `cf-moxie-data.core.category` ct
    On (itm.category_id = ct.category_id OR prod.category_id = ct.category_id)
    AND (itm.company_id = ct.company_id OR prod.company_id = ct.company_id)
  Inner Join `cf-moxie-data.core.booking` bk
    On gst.booking_id = bk.booking_id
    AND gst.company_id = bk.company_id
where gst.uuid is not null
AND gst.checkin is not null
and gst.guest_country is not null
AND CAST(TIMESTAMP_ADD(CAST(gst.Checkin AS TIMESTAMP), INTERVAL CASE
                                       WHEN cmp.timezone = 'US/Eastern' THEN 0
                                       WHEN cmp.timezone = 'US/Central' THEN 1
                                       ELSE 3
                                      END HOUR) AS DATETIME) >= '2019-04-01 00:00:00'
AND CAST(TIMESTAMP_ADD(CAST(gst.Checkin AS TIMESTAMP), INTERVAL CASE
                                       WHEN cmp.timezone = 'US/Eastern' THEN 0
                                       WHEN cmp.timezone = 'US/Central' THEN 2
                                       ELSE 3
                                      END HOUR) AS DATETIME) < '2019-09-09 23:59:59'
AND (itm.SKU like "%pcna-m%" OR prod.SKU like "%pcna-m%")
AND (bk.internal_or_external_booking = 'External Booking' OR bk.internal_or_external_booking is Null)
Order by Id



