import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';

class TicketListResponse {
  final List<TicketResponse> tickets;

  TicketListResponse({required this.tickets});

  factory TicketListResponse.fromJson(List<dynamic> json) {
    return TicketListResponse(
      tickets: json.map((e) => TicketResponse.fromJson(e)).toList(),
    );
  }
}
