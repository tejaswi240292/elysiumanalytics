view: Insider_Trading {
  derived_table: {
    sql: SELECT Distinct Ticker,transactiondate,filingdate,ownername,officertitle,securityadcode
         ,(CASE WHEN istenpercentowner='Y' THEN 'Yes' ELSE 'No' END)istenpercentowner
         ,transactionshares as Quantity,sharesownedbeforetransaction as SharesBefore
         ,sharesownedfollowingtransaction,transactioncode
         FROM Key_Fundamentals.dbo.InsiderTrading
         WHERE securityadcode NOT IN('N','D') and {% condition Symbol %} Ticker {% endcondition %}
         and {% condition Filing_Date %} filingdate {% endcondition %}
       ;;
  }

  filter: Symbol {
    type: string
  }

  filter: Filing_Date{
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: transactiondate {
    type: date
    sql: ${TABLE}.transactiondate ;;
  }

  dimension: Ticker {
    type: date
    sql: ${TABLE}.Ticker ;;
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

  dimension: Quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: SharesBefore {
    type: number
    sql: ${TABLE}.SharesBefore ;;
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
      Quantity,
      SharesBefore,
      sharesownedfollowingtransaction,
      transactioncode
    ]
  }
}
