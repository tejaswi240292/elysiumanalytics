view: agg_windows {
    sql_table_name: AGG_WINDOWS
      ;;

  dimension:  ActionType{
    sql:
     CASE
     when ${eventid} IN ('624','645','4720','4741') then 'User Add'
     when ${eventid} IN ('609','4705') then 'User Removed'
     when ${eventid} IN ('625' ,'642' ,'685' ,'4738' ,'4742' ,'4781') then 'User Changed'
        END ;;
  }


  dimension: ActionType3 {
    sql: CASE  when ${eventid} IN ('4723','4724','4794','627','628') then 'Password'
     when ${eventid} IN ('624','630','4720','4726') then 'Account'
     when ${eventid} IN ('528' ,'529' ,'530' ,'531' ,'532' ,'533' ,'534' ,'535' ,
                '536' ,'537' ,'539' ,'540' ,'4624','4625','4634','4647','4648') then 'Credentials' END  ;;
  }

  dimension: ActionType2 {
    sql: case when ${eventid} IN ('532','535') then 'Account Expired'
     when ${eventid} IN ('531','629','4725') then 'Account Disabled'
     when ${eventid} IN ('577' ,'578' ,'4672' ,'4673' ) then 'Changed Privileges'
     when ${eventid} IN ('528' ,'529' , '530' , '531' ,'532' ,
                                                    '533' ,
                                                    '534' ,
                                                    '535' ,
                                                    '536' ,
                                                    '537' ,
                                                    '539' ,
                                                    '540' ,
                                                    '4624',
                                                    '4625',
                                                    '4634',
                                                    '4647',
                                                    '4648') and  (${date_date} not between DATEADD(DAY, -1, current_date) and
                          DATEADD(DAY, -30, current_date)) then 'FirstLogin'  END;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}."DATE" ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}."HOUR" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: eventid {
    type: string
    sql: ${TABLE}."EVENTID" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: entity1 {
    type: string
    sql: ${TABLE}."ENTITY1" ;;
  }

  dimension: entity2 {
    type: string
    sql: ${TABLE}."ENTITY2" ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}."COUNT" ;;
  }
  measure: Sum_of_Count{
    type: sum
    sql: ${count} ;;
    drill_fields: [detail*]

  }
  measure: Count_of_Count {
    type: count_distinct
    sql: ${count} ;;
    drill_fields: [detail*]
  }

  dimension: y {
    type: number
    sql: ${TABLE}."Y" ;;
  }

  dimension: m {
    type: number
    sql: ${TABLE}."M" ;;
  }

  dimension: d {
    type: number
    sql: ${TABLE}."D" ;;
  }

  set: detail {
    fields: [
      date_time,
      hour,
      source,
      eventid,
      type,
      entity1,
      entity2,
      count,
      y,
      m,
      d
    ]
  }
}
