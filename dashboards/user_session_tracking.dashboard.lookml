- dashboard: user_session_tracking_summary
  title: User Session Tracking Summary
  layout: newspaper
  elements:
  - title: Location
    name: Location
    model: itd
    explore: watchguard_sessions
    type: looker_wordcloud
    fields: [watchguard_sessions.src_ip_geo_city, watchguard_sessions.count]
    filters:
      watchguard_sessions.src_ip_geo_city: "-EMPTY"
    sorts: [watchguard_sessions.src_ip_geo_city]
    limit: 500
    color_application: undefined
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Event Date: watchguard_sessions.session_start_datetime_date
      User Name: watchguard_sessions.user_name
    row: 0
    col: 7
    width: 11
    height: 4
  - title: Bandwidth
    name: Bandwidth
    model: sp
    explore: wgtrafficandsession
    type: single_value
    fields: [sum_of_in_bytes, sum_of_out_bytes]
    filters:
      wgtrafficandsession.event_id: 1AFF0024,2CFF0000,30000151
    sorts: [sum_of_in_bytes desc]
    limit: 500
    dynamic_fields: [{table_calculation: bandwidth, label: bandwidth, expression: "${sum_of_in_bytes}+${sum_of_out_bytes}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_in_bytes, based_on: wgtrafficandsession.in_bytes,
        type: sum, label: Sum of In Bytes, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_out_bytes, based_on: wgtrafficandsession.out_bytes,
        type: sum, label: Sum of Out Bytes, expression: !!null '', _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4276BE"
    single_value_title: Bandwidth
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    hidden_fields: [sum_of_in_bytes, sum_of_out_bytes]
    defaults_version: 1
    series_types: {}
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 0
    col: 18
    width: 6
    height: 4
  - title: Web Traffic Count
    name: Web Traffic Count
    model: sp
    explore: wgtrafficandsession
    type: single_value
    fields: [wgtrafficandsession.count]
    filters:
      wgtrafficandsession.event_id: 1AFF0024,2CFF0000,30000151
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#72D16D"
    single_value_title: Web Traffic Count
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 0
    col: 0
    width: 7
    height: 4
  - title: Email Counts & Size
    name: Email Counts & Size
    model: odm
    explore: msexchangemessagetracking_odm
    type: table
    fields: [msexchangemessagetracking_odm.event_time_hour, msexchangemessagetracking_odm.src_user_name,
      msexchangemessagetracking_odm.dst_email_addr, msexchangemessagetracking_odm.email_size,
      msexchangemessagetracking_odm.count]
    filters: {}
    sorts: [msexchangemessagetracking_odm.event_time_hour desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      msexchangemessagetracking_odm.count: Count
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      msexchangemessagetracking_odm.count:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Event Date: msexchangemessagetracking_odm.event_time_date
      User Name: msexchangemessagetracking_odm.src_user_name
    row: 17
    col: 14
    width: 10
    height: 7
  - title: Session Tracking
    name: Session Tracking
    model: itd
    explore: networktest
    type: table
    fields: [networktest.src_username, networktest.session_start_time_minute, networktest.session_end_time_minute,
      networktest.assigned_ips]
    filters: {}
    sorts: [networktest.session_start_time_minute desc]
    limit: 500
    dynamic_fields: [{table_calculation: duration_mi, label: Duration_MI, expression: 'diff_minutes(${networktest.session_start_time_minute},${networktest.session_end_time_minute})',
        value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: number}, {table_calculation: duration_hour,
        label: Duration_Hour, expression: 'diff_hours(${networktest.session_start_time_minute},${networktest.session_end_time_minute})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      networktest.count: Count
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      networktest.count:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields:
    listen:
      Event Date: networktest.event_date
      User Name: networktest.src_username
    row: 30
    col: 0
    width: 15
    height: 7
  - title: VPN Session Activity
    name: VPN Session Activity
    model: itd
    explore: watchguard_sessions
    type: table
    fields: [watchguard_sessions.user_name, watchguard_sessions.session_start_datetime_time,
      watchguard_sessions.session_end_datetime_time, watchguard_sessions.session_status,
      watchguard_sessions.src_ip_geo_city, watchguard_sessions.src_ip_geo_country]
    filters: {}
    sorts: [watchguard_sessions.session_start_datetime_time desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Event Date: watchguard_sessions.session_start_datetime_date
      User Name: watchguard_sessions.user_name
    row: 4
    col: 12
    width: 12
    height: 6
  - title: Social Networking Applications
    name: Social Networking Applications
    model: sp
    explore: wgtrafficandsession
    type: table
    fields: [wgtrafficandsession.src_user_name, wgtrafficandsession.session_start_time_minute,
      wgtrafficandsession.cat_web_name, wgtrafficandsession.dst_domain]
    filters:
      wgtrafficandsession.cat_web_name: "%Social%"
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 10
    col: 14
    width: 10
    height: 7
  - title: Top Blocked Sites
    name: Top Blocked Sites
    model: sp
    explore: wgtrafficandsession
    type: table
    fields: [wgtrafficandsession.session_start_time_time, wgtrafficandsession.src_user_name,
      wgtrafficandsession.service, wgtrafficandsession.cat_web_name, wgtrafficandsession.dst_domain,
      wgtrafficandsession.count]
    filters:
      wgtrafficandsession.service: "%WebBlocker%"
      wgtrafficandsession.event_id: 1AFF0021,2CFF0001,2CFF0002
    sorts: [wgtrafficandsession.session_start_time_time desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 17
    col: 0
    width: 14
    height: 7
  - title: Cloud Application
    name: Cloud Application
    model: sp
    explore: wgtrafficandsession
    type: table
    fields: [wgtrafficandsession.session_start_time_minute, wgtrafficandsession.src_user_name,
      wgtrafficandsession.cat_web_name, wgtrafficandsession.dst_domain, wgtrafficandsession.event_id]
    filters:
      wgtrafficandsession.cat_web_name: "%Information%"
      wgtrafficandsession.dst_domain: "%aws%,%azure%"
    sorts: [wgtrafficandsession.session_start_time_minute desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 24
    col: 13
    width: 11
    height: 6
  - title: Streaming Media Applications
    name: Streaming Media Applications
    model: sp
    explore: wgtrafficandsession
    type: table
    fields: [wgtrafficandsession.session_start_time_time, wgtrafficandsession.src_user_name,
      wgtrafficandsession.cat_web_name, wgtrafficandsession.dst_domain]
    filters:
      wgtrafficandsession.cat_web_name: "%Streaming%,%Internet%,%Entertain%"
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 24
    col: 0
    width: 13
    height: 6
  - title: Top Visited Sites
    name: Top Visited Sites
    model: sp
    explore: wgtrafficandsession
    type: table
    fields: [wgtrafficandsession.session_start_time_time, wgtrafficandsession.src_user_name,
      wgtrafficandsession.dst_domain, wgtrafficandsession.count, wgtrafficandsession.cat_web_name]
    filters:
      wgtrafficandsession.event_id: 1AFF0021,2CFF0001,2CFF0002
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 10
    col: 0
    width: 14
    height: 7
  - title: Overall Traffic
    name: Overall Traffic
    model: sp
    explore: wgtrafficandsession
    type: table
    fields: [wgtrafficandsession.session_end_time_date, wgtrafficandsession.src_user_name,
      wgtrafficandsession.src_ip, sum_of_in_bytes, sum_of_out_bytes]
    filters:
      wgtrafficandsession.event_id: 1AFF0024,2CFF0000,30000151
    sorts: [wgtrafficandsession.session_end_time_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: bandwidth, label: bandwidth, expression: "${sum_of_in_bytes}+${sum_of_out_bytes}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_in_bytes, based_on: wgtrafficandsession.in_bytes,
        type: sum, label: Sum of In Bytes, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_out_bytes, based_on: wgtrafficandsession.out_bytes,
        type: sum, label: Sum of Out Bytes, expression: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 4
    col: 0
    width: 12
    height: 6
  - title: Blocked Transactions
    name: Blocked Transactions
    model: sp
    explore: wgtrafficandsession
    type: table
    fields: [wgtrafficandsession.session_start_time_minute, wgtrafficandsession.src_user_name,
      wgtrafficandsession.cat_web_name, wgtrafficandsession.dst_domain]
    filters:
      wgtrafficandsession.msg: "%ProxyDeny: HTTP Request categories%,%ProxyDrop: HTTPS\
        \ Request categories%"
    sorts: [wgtrafficandsession.session_start_time_minute desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgtrafficandsession.datefilter
      User Name: wgtrafficandsession.src_user_name
    row: 30
    col: 15
    width: 9
    height: 7
  filters:
  - name: Event Date
    title: Event Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
  - name: User Name
    title: User Name
    type: field_filter
    default_value: akhil.polamarasetty
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: itd
    explore: watchguard_sessions
    listens_to_filters: []
    field: watchguard_sessions.user_name
