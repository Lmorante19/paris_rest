import 'package:flutter/material.dart';
import 'package:googleapis/connectors/v2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba2/models/products.dart';
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;
import 'package:googleapis_auth/auth_io.dart' as auth;

class ProductsService extends ChangeNotifier{

  final String _baseUrl = 'firestore.googleapis.com';
  List<Listado> products = [];

  ProductsService() {
    getProdcuts();
  }

  Future<String> getAccessToken() async {
// Your client ID and client secret obtained from Google Cloud Console
    final serviceAccountJson = {
      "type": "service_account",

      "private_key_id": "9986796ef5e3f7752e9b1e536377c07b3f788761",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDPiAynMruU3LMe\n37VDW3FqAEoSrQLgv/nDUHiQnZIzRkJMrIIA2RA31mp/fWgmjKe3iDPBwCarbI5d\nk/Hiuhw7md1jFAz/Uii+aEnU5JqaxUAXjVa7pm/qj+Hjn8ac1DVkIbAxKQwSI+l0\nhCDXMhSQuAsGx95CUA+YjkGK55EcaASkDatErnj8c8IpQIgEBJlELc2Y03jj77zd\nkY9nCtXE+z/4/jl+/dx+FrGSbc0/dIM+UQ4UHk7kYxUVB+gz/xlXD5vPMruVSQ42\nT30Cj5seQBM+fLSLbrjGk3WOQGS0PKeSYUHSr4wKKzfCCPt/UuI3FNA/p4jEIci2\nzMN2EAmZAgMBAAECggEABe7m0F+T8KqVTbxUQKu8RK04xkCUr3uYQWxAi387Gc+C\nv7xthGawSa24omfMctBcpH5MCdhbgqp6MNS0+qga0d1mm0Q3JumLaVOD9jE0S654\nqZ5h12rnvOCw3ZgeI90GoGk80fr8HFyoelX4tmOj0OC3d/x+LzkovlIlhOTKnPGT\nL6OJKG6V5YVm2Vzb7PpOV4qiFZVOBux0PRMTkBTk4QUu54WmkYBS0ooWfOXDpyaN\nkPPRQNvL9P0d/kofT+u3mTrxmOmpUxea3BuPFChSJUixgm1DlAOz4I6MrxYx4qoY\nBNWal6MCPhE5WfDO93Ge/8Qyne64/5FvsoNgR32ubQKBgQDoNAqivRFknwW7eidi\nf+2i7BhQtr/JN5WDOIfMI+NrgmB9Xfu9ErZVuqUJq+vFWXKt1MXEL4+NJM9AOuVD\nmWUlBktggSzG4Dbsz2SUyk3dKUX+yd2qk2ul0ZumuHNOPBzakAHLkK9LRyDGV1eo\nRb1LFsvFPl+q5DEhbJ0S6XiMzwKBgQDkzLsaNHx4l3T9PjxbmTCyO1lxva4WHWqw\nk97pCrVs0oNzw7H/kUaGmZoMmV5Lis0KuF9+RDzZaixb7JCMXm81iny01Z3Pn34q\njMxSa57tmphThFG0lQ2cAeO8ZOpUnBs+g3L8wquap4OrDWXTn4V/nkb8mHBRm0rL\nGAhp+ZUtFwKBgDFt+qGf+9benzrEiyPFtdGLzrVH4dW0tmgjnYzQSvY039NwMUmT\ndSsUu1MuvNba7rWgaKUVtspF/rRelTVprwVNrLgTZ3PCgQ6yK2gdFKwywAq38C8C\niNTYpPi9pRYPZ9kC9M7fsuEkeA6gwzE3/06/wIrxdy4Ku4aw91LyTk4zAoGAIGlw\nR/IPf/XUuNtMKZ217EnEDfzU4IUiTAlmlpTRxqy7unaKjK3D0+WGkSpY1VLAYThl\nLrnz9Mi5p/wHLhtina8Uo3lvda4ebWCswTBFv1sbIRmpiW9kEimiXVneaEYFBgIR\nFAVv0eTRHjYzqpr6im2dmMLvhl/9ZG/vITQeEdkCgYEA5+i4LTvxKzfTR7ab1KO2\nXqseDjASFSK9GiS+QwHx7OquXOWZ3tlZol7oLifWKacQPQa7Ye1AyB+DIQynjuV+\nfCO9V5lOfw9dZdAKGNAj+MahOpFCcp2UrjJLUQSkfxm4u/FeIXtAd7bETaPFjaEm\nXIOwVAchFwLIw5ypqmPDrhA=\n-----END PRIVATE KEY-----\n",
      "client_email": "externalauth@backproject-96086.iam.gserviceaccount.com",
      "client_id": "114722573769999735696",
    };
    var accountCredentials = auth.ServiceAccountCredentials.fromJson({
      "type": "service_account",
      "project_id": "backproject-96086",
      "private_key_id": "9986796ef5e3f7752e9b1e536377c07b3f788761",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDPiAynMruU3LMe\n37VDW3FqAEoSrQLgv/nDUHiQnZIzRkJMrIIA2RA31mp/fWgmjKe3iDPBwCarbI5d\nk/Hiuhw7md1jFAz/Uii+aEnU5JqaxUAXjVa7pm/qj+Hjn8ac1DVkIbAxKQwSI+l0\nhCDXMhSQuAsGx95CUA+YjkGK55EcaASkDatErnj8c8IpQIgEBJlELc2Y03jj77zd\nkY9nCtXE+z/4/jl+/dx+FrGSbc0/dIM+UQ4UHk7kYxUVB+gz/xlXD5vPMruVSQ42\nT30Cj5seQBM+fLSLbrjGk3WOQGS0PKeSYUHSr4wKKzfCCPt/UuI3FNA/p4jEIci2\nzMN2EAmZAgMBAAECggEABe7m0F+T8KqVTbxUQKu8RK04xkCUr3uYQWxAi387Gc+C\nv7xthGawSa24omfMctBcpH5MCdhbgqp6MNS0+qga0d1mm0Q3JumLaVOD9jE0S654\nqZ5h12rnvOCw3ZgeI90GoGk80fr8HFyoelX4tmOj0OC3d/x+LzkovlIlhOTKnPGT\nL6OJKG6V5YVm2Vzb7PpOV4qiFZVOBux0PRMTkBTk4QUu54WmkYBS0ooWfOXDpyaN\nkPPRQNvL9P0d/kofT+u3mTrxmOmpUxea3BuPFChSJUixgm1DlAOz4I6MrxYx4qoY\nBNWal6MCPhE5WfDO93Ge/8Qyne64/5FvsoNgR32ubQKBgQDoNAqivRFknwW7eidi\nf+2i7BhQtr/JN5WDOIfMI+NrgmB9Xfu9ErZVuqUJq+vFWXKt1MXEL4+NJM9AOuVD\nmWUlBktggSzG4Dbsz2SUyk3dKUX+yd2qk2ul0ZumuHNOPBzakAHLkK9LRyDGV1eo\nRb1LFsvFPl+q5DEhbJ0S6XiMzwKBgQDkzLsaNHx4l3T9PjxbmTCyO1lxva4WHWqw\nk97pCrVs0oNzw7H/kUaGmZoMmV5Lis0KuF9+RDzZaixb7JCMXm81iny01Z3Pn34q\njMxSa57tmphThFG0lQ2cAeO8ZOpUnBs+g3L8wquap4OrDWXTn4V/nkb8mHBRm0rL\nGAhp+ZUtFwKBgDFt+qGf+9benzrEiyPFtdGLzrVH4dW0tmgjnYzQSvY039NwMUmT\ndSsUu1MuvNba7rWgaKUVtspF/rRelTVprwVNrLgTZ3PCgQ6yK2gdFKwywAq38C8C\niNTYpPi9pRYPZ9kC9M7fsuEkeA6gwzE3/06/wIrxdy4Ku4aw91LyTk4zAoGAIGlw\nR/IPf/XUuNtMKZ217EnEDfzU4IUiTAlmlpTRxqy7unaKjK3D0+WGkSpY1VLAYThl\nLrnz9Mi5p/wHLhtina8Uo3lvda4ebWCswTBFv1sbIRmpiW9kEimiXVneaEYFBgIR\nFAVv0eTRHjYzqpr6im2dmMLvhl/9ZG/vITQeEdkCgYEA5+i4LTvxKzfTR7ab1KO2\nXqseDjASFSK9GiS+QwHx7OquXOWZ3tlZol7oLifWKacQPQa7Ye1AyB+DIQynjuV+\nfCO9V5lOfw9dZdAKGNAj+MahOpFCcp2UrjJLUQSkfxm4u/FeIXtAd7bETaPFjaEm\nXIOwVAchFwLIw5ypqmPDrhA=\n-----END PRIVATE KEY-----\n",
      "client_email": "externalauth@backproject-96086.iam.gserviceaccount.com",
      "client_id": "114722573769999735696",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/externalauth%40backproject-96086.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    });

    List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "httos://www.googleapis.com/auth/firebase.database"
    ];
    print(accountCredentials.privateKey);

    print(accountCredentials.impersonatedUser);
    print(accountCredentials.privateRSAKey);

    var client = http.Client();
    // client = await auth.clientViaServiceAccount(accountCredentials, scopes);
    // print(client);

    var credentials =  await auth.obtainAccessCredentialsViaServiceAccount(accountCredentials, scopes, client);
    print(credentials);


    client.close;

    return credentials.accessToken.data;
  }

  //Funcion para Obtener productos
  Future getProdcuts() async {

    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'v1/projects/backproject-96086/databases/',
    );
    print(url);
    final String serverKey = await getAccessToken();
    print(serverKey);
    String bearerAuth = 'bearer ' + serverKey;
    final response = await http.get(url, headers: {'authorization': bearerAuth});
    final productsMap = Product.fromJson(response.body);
    print(response.body);
    //products = productsMap.listado;
    //isLoading = false;
    notifyListeners();
  }

}
