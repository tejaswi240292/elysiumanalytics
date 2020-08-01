view: Insider_Trading {
  derived_table: {
    sql: SELECT Distinct transactiondate,filingdate,ownername,officertitle,securityadcode
         ,(CASE WHEN istenpercentowner='Y' THEN 'Yes' ELSE 'No' END)istenpercentowner
         ,transactionshares,sharesownedbeforetransaction
         ,sharesownedfollowingtransaction,transactioncode
         FROM Key_Fundamentals.dbo.InsiderTrading
         WHERE Ticker ='AAPL' AND securityadcode NOT IN('N','D')
         and filingdate ='2008-03-26'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: transactiondate {
    type: date
    sql: ${TABLE}.transactiondate ;;
  }

  dimension: filingdate {
    type: date
    sql: ${TABLE}.filingdate ;;
  }

  dimension: ownername {
    type: string
    sql: ${TABLE}.ownername ;;
  }

  dimension: officertitle {
    type: string
    sql: ${TABLE}.officertitle ;;
  }

  dimension: securityadcode {
    type: string
    sql: ${TABLE}.securityadcode ;;
  }

  dimension: istenpercentowner {
    type: string
    sql: ${TABLE}.istenpercentowner ;;
  }

  dimension: transactionshares {
    type: number
    sql: ${TABLE}.transactionshares ;;
  }

  dimension: sharesownedbeforetransaction {
    type: number
    sql: ${TABLE}.sharesownedbeforetransaction ;;
  }

  dimension: sharesownedfollowingtransaction {
    type: number
    sql: ${TABLE}.sharesownedfollowingtransaction ;;
  }

  dimension: transactioncode {
    type: string
    sql: ${TABLE}.transactioncode ;;
  }

  set: detail {
    fields: [
      transactiondate,
      filingdate,
      ownername,
      officertitle,
      securityadcode,
      istenpercentowner,
      transactionshares,
      sharesownedbeforetransaction,
      sharesownedfollowingtransaction,
      transactioncode
    ]
  }
}
