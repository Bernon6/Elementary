import QtQuick 2.0

ListModel {
    id: elementListModel
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
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "data.csv");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var response = xhr.responseText;
                var lines = response.split('\n');
                for(var i = 1; i < lines.length; ++i) {
                    var line = lines[i].split(',');
                    elementListModel.append(
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
