view: feature_agg {
  derived_table: {
    sql: select fg.key::string as feature,fg.value::bigint as feature_value, event_start_date,event_end_date,event_hour,time_frame,
      type,name from table(fn_agg({%parameter src_type%},{%parameter type1%},{%parameter date_type1%},{%parameter date%})),LATERAL FLATTEN(FEATURE_AGG) FG
       ;;

  }

  parameter: src_type {
    type: string
  }

  parameter: type1 {
    type: string
  }

  parameter: date_type1 {
    type: string
  }

  parameter: date {
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: minimum_value{
    type: min
    sql: ${feature_value} ;;
  }

  measure: maximum_value{
    type: max
    sql: ${feature_value} ;;
  }

  measure: median_value {
    type: median
    sql: ${feature_value} ;;
  }

  measure: 75th_percentile_value {
    type: percentile
    percentile: 75
    sql: ${feature_value} ;;
  }

  measure: 25th_percentile_value {
    type: percentile
    percentile: 25
    sql: ${feature_value} ;;
  }



# This is our parameter which our user will populate
  parameter:  feature_buckets {
    type: string
  }

# This dimension uses liquid (the {%} stuff) to do some parsing and builds a case statement
  dimension: feature_compare_groups {
    type: string
    sql:
    {% assign my_array = feature_buckets._parameter_value | remove: "'" | split: "," %}
        {% assign sort = '-1' %}
    {% assign last_group_max_label = ' 0' %}

    case
    {%for element in my_array%}
    {% assign sort = sort | plus: 1 %}

      when ${feature_value}<{{element}} then '{{sort}}. {{last_group_max_label}} < N < {{element}}'
      {% assign last_group_max_label = element %}
    {%endfor%}
    {% assign sort = sort | plus: 1 %}

      when ${feature_value}>={{last_group_max_label}} then '{{sort}}. >= {{last_group_max_label}}'
    else 'unknown'
    end
          ;;
  }

   parameter: bucket_size {

    default_value: "10000"
    type: number
  }


  dimension: dynamic_bucket  {
    sql:
        concat(${feature_value} - mod(${feature_value},{% parameter bucket_size %}),
          '-', ${feature_value} - mod(${feature_value},{% parameter bucket_size %}) + {% parameter bucket_size %})
      ;;
    order_by_field: dynamic_sort_field
  }

  dimension: dynamic_sort_field {
    sql:
      ${feature_value} - mod(${feature_value},{% parameter bucket_size %});;
    type: number
    hidden: yes
  }




  dimension: feature {
    type: string
    sql: ${TABLE}."FEATURE" ;;
    drill_fields: [detail*]
    link: {
      label: "drill inside"
      url: "/dashboards/101?Feature={{value}}"
    }
  }

  dimension: feature_value {
    type: number
    sql: ${TABLE}."FEATURE_VALUE" ;;
  }

  dimension: event_start_date {
    type: date
    sql: ${TABLE}."EVENT_START_DATE" ;;
  }

  dimension: event_end_date {
    type: date
    sql: ${TABLE}."EVENT_END_DATE" ;;
  }

  dimension: event_hour {
    type: number
    sql: ${TABLE}."EVENT_HOUR" ;;
  }

  dimension: time_frame {
    type: string
    sql: ${TABLE}."TIME_FRAME" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  set: detail {
    fields: [
      feature,
      feature_value,
      event_start_date,
      event_end_date,
      event_hour,
      time_frame,
      type,
      name
    ]
  }
}
