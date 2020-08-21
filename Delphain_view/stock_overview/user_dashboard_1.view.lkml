view: user_dashboard_1 {
  derived_table: {
    sql: Select  {% parameter Sym %} as Symbol
            ,{% parameter date %} as Date
            ,'Profile'                    as Profile
            ,'State Modeling'             as State_Modeling
            ,'Financials-BalanceSheet'    as Financials_BalanceSheet
            ,'Institution Trading'        as Institution_Trading
            ,'Financials - Cash Flow'     as Financials_Cash_Flow
            ,'Events'                     as Events
            ,'ETF Exposure'               as ETF_Exposure
            ,'Daily News'                 as Daily_News
            ,'Chart'                      as Chart
            ,'Key Ratios'                 as Key_Ratios
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: Sym {
    type: string
   }

  parameter: date {
    type: date
  }

  dimension: symbol {
    sql: ${TABLE}."Symbol";;
    type: string
    drill_fields: [symbol]
    link:
    {
      label: "Open Dashboard"
      url: "https://elysiumanalytics.looker.com/dashboards/274?Symbol={{ value }}"
    }
  }

  dimension: dte {
    sql: ${TABLE}."Date";;
    type: date
  }

  dimension: profile {
    sql: ${TABLE}."Profile";;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/265?Symbol={{symbol._value}}&Date={{dte._value}}"
    }
  }

  dimension: state_modeling {
    sql: ${TABLE}."STATE_MODELING" ;;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/252?Symbol={{symbol._value}}&Date={{dte._value}}"
    }
  }

  dimension: financials_balancesheet {
    sql: ${TABLE}."FINANCIALS_BALANCESHEET" ;;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/263?Symbol={{symbol._value}}"
    }
  }

  #dimension: institution_trading {
  #  type: string
  #  sql: ${TABLE}."INSTITUTION_TRADING" ;;
  #}

  dimension: institution_trading {
    sql: ${TABLE}."INSTITUTION_TRADING";;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/256?Symbol={{symbol._value}}&Date={{dte._value}}"
    }
  }

  dimension: financials_cash_flow {
    sql: ${TABLE}."FINANCIALS_CASH_FLOW" ;;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/263?Symbol={{symbol._value}}"
    }
  }

  dimension: events {
    sql: ${TABLE}."EVENTS" ;;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/253?Symbol={{symbol._value}}"
    }
  }

  dimension: etf_exposure {
    sql: ${TABLE}."ETF_EXPOSURE" ;;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/255?Symbol={{symbol._value}}"
    }
  }

#  dimension: daily_news {
#    type: string
#    sql: ${TABLE}."DAILY_NEWS" ;;
#    html: {
#      <a href="https://elysiumanalytics.looker.com/dashboards/274?Symbol={{ linked_value }}"${sym}></a>
#      };;
#  }

  dimension: Daily_News {
    sql: ${TABLE}."Daily_News";;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/274?Symbol={{symbol._value}}&Date={{dte._value}}"
    }
  }

  dimension: chart {
    sql: ${TABLE}."CHART" ;;
    type: string
    drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/257?Symbol={{symbol._value}}"
    }
  }

  dimension: key_ratios {
    sql: ${TABLE}."KEY_RATIOS" ;;
    type: string
   drill_fields: []
    link:
    {
      label: "Open Dashboard"
      url: "/dashboards/264?Symbol={{symbol._value}}"
    }

  }

  set: detail {
    fields: [
      symbol,
      dte,
      profile,
      state_modeling,
      financials_balancesheet,
      institution_trading,
      financials_cash_flow,
      events,
      etf_exposure,
      Daily_News,
      chart,
      key_ratios
    ]
  }
}
