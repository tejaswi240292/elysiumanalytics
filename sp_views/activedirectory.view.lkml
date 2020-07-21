view: activedirectory {
  derived_table: {
    sql: select * from (select lower(SAMACCOUNTNAME) as name,
          DISPLAYNAME,
          DESCRIPTION,
          EMAILADDRESS,
          city,
          country,
          ROW_NUMBER() over ( partition by SAMACCOUNTNAME order by WHENCHANGED desc) as row_n
                from ACTIVEDIRECTORY_USERS where   DESCRIPTION!='' ) where row_n=1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: displayname {
    type: string
    sql: ${TABLE}."DISPLAYNAME" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: emailaddress {
    type: string
    sql: ${TABLE}."EMAILADDRESS" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: row_n {
    type: number
    sql: ${TABLE}."ROW_N" ;;
  }

  set: detail {
    fields: [
      name,
      displayname,
      description,
      emailaddress,
      city,
      country,
      row_n
    ]
  }
}
