import QtQuick 2.0

ListModel {
    id: elementGridModel
    Component.onCompleted: {
        /*
          data.csv columns
           0 - Period
           1 - Group
           2 - Number
           3 - Symbol
           4 - Name
           5 - Weight
           6 - Electron Configuration
           7 - Electronegativity
               ...
          14 - State
          15 - Bond
          16 - Melt(K)
          17 - Boil(K)
          18 - Density(g/cm3)
          19 - Class
          20 - Date
        */
        for(var cell = 0; cell < 180; ++cell) {
            elementGridModel.append(
              {
                "ePeriod": "",
                "eGroup":  "",
                "eNumber": "",
                "eSymbol": "",
                "eName":   "",
                "eWeight": "",
                "eConfig": "",
                "eNeg":    "",
                "eMelt":   "",
                "eBoil":   "",
                "eDate":   ""
              }
            );
        }

        var xhr = new XMLHttpRequest;
        xhr.open("GET", "data.csv");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var response = xhr.responseText;
                var lines = response.split('\n');
                for(var i = 1; i < lines.length; ++i) {
                    // need to map line to cell, but have blank cells
                    var line = lines[i].split(',');
                    var period = parseInt(line[0]);
                    var group = parseInt(line[1]);
                    var num = parseInt(line[2]);
                    var cell = ((period - 1) * 18) + group - 1;
                    if(num > 56 && num < 72)
                        cell = 146 + num - 56;
                    if(num > 88 && num < 104)
                        cell = 164 + num - 88;
                    elementGridModel.set(
                      cell,
                      {
                        "ePeriod": line[0],
                        "eGroup":  line[1],
                        "eNumber": line[2],
                        "eSymbol": line[3],
                        "eName":   line[4],
                        "eWeight": line[5],
                        "eConfig": line[6],
                        "eNeg":    line[7],
                        "eMelt":   line[16],
                        "eBoil":   line[17],
                        "eDate":   line[20]
                      }
                    );
                }
            }
        };
        xhr.send();
    }
}
