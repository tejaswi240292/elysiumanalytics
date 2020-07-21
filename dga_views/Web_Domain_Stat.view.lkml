view: web_domain_stat {
  derived_table: {
    sql:select * from (select DST_DOMAIN,FIRST_SEEN,LAST_SEEN,sum(TOTAL_BYTES) as TOTAL_BYTES,max(NONGENUINE_PERCENT) as NONGENUINE_PERCENT,TLD,TLDEXIST,WHITELISTED,PREDICTION_VALUE,PREDICTION,
DOMAIN_AGE,EXECUTION_TIMESTAMP,
listagg(session_user,',') as USER from (
with domains as (
with flat as (
SELECT WGT.DST_DOMAIN,WGT.distinct_IPs,WGT.FIRST_SEEN,WGT.LAST_SEEN,WGT.Total_bytes,
ML.TLD,ML.TLDEXIST,ML.WHITELISTED,ML.PREDICTION_VALUE,ML.PREDICTION,ML.DOMAIN_AGE,ML.EXECUTION_TIMESTAMP,
ML.NONGENUINE_PERCENT
FROM
(select DISTINCT DST_DOMAIN,ARRAY_AGG(DISTINCT SRC_IP) AS distinct_IPs,MIN(EVENT_TIME) AS FIRST_SEEN,MAX(EVENT_TIME) AS LAST_SEEN,
 sum(IN_BYTES) + sum(OUT_BYTES) as Total_bytes FROM WGTRAFFIC_ODM
WHERE  {% condition datefilter %} EVENT_TIME {% endcondition %}
 GROUP BY 1) WGT
JOIN
(Select DSTNAME,TLD,TLDEXIST,WHITELISTED,PREDICTION_VALUE,PREDICTION,DOMAIN_AGE,EXECUTION_TIMESTAMP,NONGENUINE_PERCENT from ML_DGA_MODEL_OUTPUT) ML
ON (WGT.DST_DOMAIN = ML.DSTNAME))
SELECT DST_DOMAIN,FIRST_SEEN,LAST_SEEN,TOTAL_BYTES,TLD,TLDEXIST,WHITELISTED,PREDICTION_VALUE,PREDICTION,DOMAIN_AGE,EXECUTION_TIMESTAMP,
NONGENUINE_PERCENT,replace(STV.VALUE,'"','') AS IP
FROM flat,LATERAL FLATTEN(input => DISTINCT_IPS) STV),
users as (SELECT LISTAGG(DISTINCT lower(SRC_USERNAME), ',') as session_user,STV.VALUE::string AS src_ip
FROM
NP_SESSION_TRACKING_INFO, LATERAL FLATTEN(ASSIGNED_IPS) STV
WHERE {% condition datefilter %} EVENT_DATE {% endcondition %}
and src_ip like '192%' GROUP BY 2)
SELECT DST_DOMAIN,FIRST_SEEN,LAST_SEEN,TOTAL_BYTES,NONGENUINE_PERCENT,TLD,TLDEXIST,WHITELISTED,PREDICTION_VALUE,PREDICTION,DOMAIN_AGE,EXECUTION_TIMESTAMP,IP,users.session_user
from domains left join users on domains.ip = users.src_ip )sst
group by DST_DOMAIN,FIRST_SEEN,LAST_SEEN,TLD,TLDEXIST,WHITELISTED,PREDICTION_VALUE,PREDICTION,DOMAIN_AGE,EXECUTION_TIMESTAMP)
where {% condition Userfilter %} user {% endcondition %}
;;

}

  filter: datefilter {
    type: date
  }
  filter: Userfilter {
    type: string
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: FIRST_SEEN {
    type: date
    sql: ${TABLE}."FIRST_SEEN" ;;
  }

  dimension: LAST_SEEN {
    type: date
    sql: ${TABLE}."LAST_SEEN" ;;
  }

  dimension: DST_DOMAIN {
    type: string
    sql: ${TABLE}."DST_DOMAIN" ;;
  }


  dimension: TOTAL_BYTES {
    type: number
    sql: ${TABLE}."TOTAL_BYTES" ;;
  }

  dimension: NONGENUINE_PERCENT {
    type: number
    sql: ${TABLE}."NONGENUINE_PERCENT" ;;
  }
  dimension: TLD {
    type: string
    sql: ${TABLE}."TLD" ;;
  }


  dimension: TLDEXIST {
    type: string
    sql: ${TABLE}."TLDEXIST" ;;
  }

  dimension: WHITELISTED {
    type: string
    sql: ${TABLE}."WHITELISTED" ;;
  }
  dimension: PREDICTION_VALUE {
    type: number
    sql: ${TABLE}."PREDICTION_VALUE" ;;
  }
  dimension: PREDICTION {
    type: string
    sql: ${TABLE}."PREDICTION" ;;
  }
  dimension: DOMAIN_AGE {
    type: number
    sql: ${TABLE}."DOMAIN_AGE" ;;
  }
  dimension: EXECUTION_TIMESTAMP {
    type: number
    sql: ${TABLE}."EXECUTION_TIMESTAMP" ;;
  }
    dimension: USER {
    type: string
    sql:  ${TABLE}."USER" ;;

  }
  set: detail {
    fields: [
      FIRST_SEEN,
      LAST_SEEN,
      DST_DOMAIN,
      TOTAL_BYTES,
      NONGENUINE_PERCENT,
      TLD,
      TLDEXIST,
      WHITELISTED,
      PREDICTION_VALUE,
      PREDICTION,
      DOMAIN_AGE,
      EXECUTION_TIMESTAMP,
      USER
    ]
  }
}
