import '../class/request_state.dart';


handleResponse(response) {

   if (response is RequestState) {
        return response;
      } else {
      return RequestState.loaded;
    }

 }
