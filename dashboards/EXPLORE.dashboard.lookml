- dashboard: explore
  title: EXPLORE
  layout: newspaper
  elements:
  - name: ''
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_msexchange?fields=vw_odm_msexchange.event_time_date,vw_odm_msexchange.src_username,vw_odm_msexchange.src_ip,vw_odm_msexchange.hostname,vw_odm_msexchange.dst_ip&f[vw_odm_msexchange.event_time_date]=1+days&sorts=vw_odm_msexchange.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22vw_odm_msexchange.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded" class="button">MSEXCHANGE</a>
         </body>
      </html>
    row: 2
    col: 12
    width: 3
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href=
      "/explore/odm/vw_odm_sysmon?fields=vw_odm_sysmon.event_time_date,vw_odm_sysmon.dst_ip,vw_odm_sysmon.src_ip,vw_odm_sysmon.src_username,vw_odm_sysmon.hostname&f[vw_odm_sysmon.event_time_date]=1+days&sorts=vw_odm_sysmon.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22vw_odm_sysmon.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded" class="button">MSEXCHANGEAGENT</a>
         </body>
      </html>
    row: 0
    col: 18
    width: 4
    height: 2
  - name: " (3)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_symantecnetwork?fields=vw_odm_symantecnetwork.event_time_date,vw_odm_symantecnetwork.source_name&f[vw_odm_symantecnetwork.event_time_date]=1+days&sorts=vw_odm_symantecnetwork.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22vw_odm_symantecnetwork.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded" class="button">SYMANTECNETWORK</a>
         </body>
      </html>
    row: 0
    col: 0
    width: 4
    height: 2
  - name: " (4)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_wgevent?fields=vw_odm_wgevent.dst_ip,vw_odm_wgevent.event_time_date,vw_odm_wgevent.hostname,vw_odm_wgevent.src_ip,vw_odm_wgevent.src_username&f[vw_odm_wgevent.event_time_date]=1+days&sorts=vw_odm_wgevent.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22series_types%22%3A%7B%7D%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22vw_odm_wgevent.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded" class="button">WGEVENT</a>
         </body>
      </html>
    row: 2
    col: 15
    width: 3
    height: 2
  - name: " (5)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_wgtraffic?fields=vw_odm_wgtraffic.event_time_date,vw_odm_wgtraffic.sender,vw_odm_wgtraffic.src_ip&f[vw_odm_wgtraffic.event_time_date]=1+days&sorts=vw_odm_wgtraffic.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22vw_odm_wgtraffic.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded" class="button">WGTRAFFIC</a>
         </body>
      </html>
    row: 0
    col: 15
    width: 3
    height: 2
  - name: " (6)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_symantecendpoint?fields=vw_odm_symantecendpoint.event_time_date,vw_odm_symantecendpoint.source&f[vw_odm_symantecendpoint.event_time_date]=1+days&sorts=vw_odm_symantecendpoint.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22series_types%22%3A%7B%7D%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22vw_odm_symantecendpoint.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded" class="button">SYMANTECENDPOINT</a>
         </body>
      </html>
    row: 2
    col: 0
    width: 4
    height: 2
  - name: " (7)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_sysmon?fields=vw_odm_sysmon.event_time_date,vw_odm_sysmon.dst_ip,vw_odm_sysmon.src_ip,vw_odm_sysmon.src_username,vw_odm_sysmon.hostname&sorts=vw_odm_sysmon.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded" class="button">SYSMON</a>
         </body>
      </html>
    row: 0
    col: 9
    width: 3
    height: 2
  - name: " (8)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_wgnetflow?fields=vw_odm_wgnetflow.dst_ip,vw_odm_wgnetflow.event_time,vw_odm_wgnetflow.src_ip&sorts=vw_odm_wgnetflow.dst_ip&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded" class="button">WGNETFLOW</a>
         </body>
      </html>
    row: 0
    col: 12
    width: 3
    height: 2
  - name: " (9)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_msexchangeconnectivity?fields=vw_odm_msexchangeconnectivity.event_time_date,vw_odm_msexchangeconnectivity.source&f[vw_odm_msexchangeconnectivity.event_time_date]=1+days&sorts=vw_odm_msexchangeconnectivity.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22vw_odm_msexchangeconnectivity.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded" class="button">MSEXCHANGECONNECTIVITY</a>
         </body>
      </html>
    row: 0
    col: 4
    width: 5
    height: 2
  - name: " (10)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/iis_odm?fields=iis_odm.src_ip&sorts=iis_odm.src_ip&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%7D&filter_config=%7B%7D&origin=share-expanded" class="button">IIS</a>
         </body>
      </html>
    row: 2
    col: 9
    width: 3
    height: 2
  - name: " (11)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #1c87c9;
               border: none;
               color: white;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_windowsnxlog?fields=vw_odm_windowsnxlog.event_time_date,vw_odm_windowsnxlog.src_username,vw_odm_windowsnxlog.hostname,vw_odm_windowsnxlog.src_ip&f[vw_odm_windowsnxlog.event_time_date]=1+days&sorts=vw_odm_windowsnxlog.event_time_date+desc&limit=5&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22vw_odm_windowsnxlog.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded" class="button">WINDOWSNXLOG</a>
         </body>
      </html>
    row: 2
    col: 18
    width: 4
    height: 2
  - name: " (12)"
    type: text
    body_text: |-
      <html>
         <head>
            <style>
               .button {
               background-color: #FF0000;
               border: none;
               color: red;
               padding: 20px 34px;
               text-align: center;
               text-decoration: none;
               display: inline-block;
               font-size: 20px;
               margin: 4px 2px;
               cursor: pointer;
               }
            </style>
         </head>
         <body>
            <a href="/explore/odm/vw_odm_windows?fields=vw_odm_windows.src_username&f[vw_odm_wgtraffic.event_time_date]=1+days&f[vw_odm_windows.event_time_date]=1+days&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%7D&filter_config=%7B%22vw_odm_wgtraffic.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22vw_odm_windows.event_time_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded" class="button">POWER EXPLORE</a>
         </body>
      </html>
    row: 2
    col: 4
    width: 5
    height: 2
