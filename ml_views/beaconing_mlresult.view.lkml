view: beaconing_mlresult {

    sql_table_name:beaconing_ml_result
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: first_event {
    type: time
    sql: ${TABLE}."FIRST_EVENT" ;;
  }

  dimension: event_time {
    type: date
    sql: ${TABLE}."FIRST_EVENT" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;
    link: {
      label: "viz"
      url: "/dashboards/195?srcip={{value}}&dstip={{dst_ip._value}}&date={{event_time._value}}"
    }
  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: epoch_list_len {
    type: number
    sql: ${TABLE}."EPOCH_LIST_LEN" ;;
  }

  dimension: pattern {
    type: string
    sql: ${TABLE}."PATTERN" ;;
  }

  dimension: epoch_list {
    type: string
    sql:${TABLE}."EPOCH_LIST" ;;
 }

  dimension: epoch_list_highlighted {
    type: string
    sql:ARRAY_TO_STRING( ${epoch_list} , ',');;
    required_fields: [patterlist]
    # Note that "required_fields" parameter is added so that this dimension can be displayed alone. Group by in SQL will include pattern dimension
    html:
          {% assign stripped_pattern = patterlist._value | remove: '['| remove: ']' %}
          {% assign highlight = stripped_pattern | prepend: '<mark>' | append: '</mark>' %}
          {% if value contains stripped_pattern  %}
            <p style="color: black;word-wrap : break-word;max-width : 700px";>{{value | replace: stripped_pattern, highlight }}</p>
          {% else %}
            <p style="color: black;word-wrap: break-word;max-width :700px";>{{value}}</p>
          {% endif %};;
  }




  dimension:patterlist {
    type: string
    sql: ARRAY_TO_STRING( ${pattern} , ',') ;;
  }






  dimension: pattern_len {
    type: number
    sql: ${TABLE}."PATTERN_LEN" ;;
  }

  dimension: srcip_prev_score {
    type: number
    sql: ${TABLE}."SRCIP_PREV_SCORE" ;;
  }

  dimension: dstip_prev_score {
    type: number
    sql: ${TABLE}."DSTIP_PREV_SCORE" ;;
  }

  dimension: execution_timestamp {
    type: number
    sql: ${TABLE}."EXECUTION_TIMESTAMP" ;;
  }





  set: detail {
    fields: [
      first_event_time,
      src_ip,
      dst_ip,
      epoch_list,
      epoch_list_len,
      pattern,
      pattern_len,
      srcip_prev_score,
      dstip_prev_score,
      execution_timestamp
    ]
  }
}
