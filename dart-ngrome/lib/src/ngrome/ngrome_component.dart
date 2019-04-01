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
    materialInputDirectives, //NgModel,
    NgIf
  ],
  providers: [ClassProvider(NgRomeService)]
)
class NgRomeComponent {
  
  // Injection Reference
  final NgRomeService ngRomeService;

  bool toShow = false;
  String myModel = '';
  String myName = '';

  NgRomeComponent(this.ngRomeService);

  pressed() {
    this.ngRomeService.setString(this.myModel);
    print(this.ngRomeService.getString());
    this.myModel = 'You are ' + this.myModel;
    this.ngRomeService.setString(this.myModel);
    //console.log(this.ngrome.getString());
    if (this.myModel.length > 0) {
      this.toShow = true;
      this.myName = 'You are ' + this.ngRomeService.getString();
    }
  }

}