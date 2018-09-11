#! /bin/bash

source ./fetch_tickets_xml.sh

source ./fetch_active_detections_xml.sh

source ./fetch_changed_detections_xml.sh

source ./convert_tickets_xml_to_log.sh

source ./convert_detections_active_xml_to_log.sh

source ./convert_detections_changed_xml_to_log.sh

source ./fetch_web_app_scan_list.sh

source ./extract_web_app_scan_ids.sh

source ./fetch_web_app_scan_results.sh

source ./convert_web_app_scan_result_xml_to_log.sh

exit 0
