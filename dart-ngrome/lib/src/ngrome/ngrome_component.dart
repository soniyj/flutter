import 'package:angular/angular.dart';

// Material
import 'package:angular_components/angular_components.dart'; //All
//import 'package:angular_components/material_input/material_input.dart'; //Specific

import 'ngrome_service.dart';

/**
 * NOTE: All Components need to be imported into either directives or providers
 * Check AngularDart guidelines
 */

@Component(
  selector: 'ngrome',
  styleUrls: ['ngrome_component.css'],
  templateUrl: 'ngrome_component.html',
  directives: [
    MaterialInputComponent,
    MaterialButtonComponent,
    materialInputDirectives //NgModel
  ],
  providers: [ClassProvider(NgRomeService)]
)
class NgRomeComponent {
  
  // Injection Reference
  final NgRomeService ngRomeService;

  String my_model = '';

  NgRomeComponent(this.ngRomeService);

  pressed() {
    this.ngRomeService.setString(this.my_model);
    print(this.ngRomeService.getString());
    this.my_model = 'You are ' + this.my_model;
  }

}