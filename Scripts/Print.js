function printData() {
    var dataCards = document.getElementById('Data_Cards').innerHTML;

    // Create a new window for the PDF content
    var printWindow = window.open('', '_blank');

    // Add data and styling to the new window
    printWindow.document.write('<html><head><title>Print Report</title></head><body>');
    printWindow.document.write('<h2>Printed Report</h2>');
    printWindow.document.write(dataCards);
    printWindow.document.write('<p>Printed on: ' + new Date().toLocaleString() + '</p>');
    printWindow.document.write('</body></html>');

    // Load and print the PDF
    printWindow.document.close();
    printWindow.print();
}

function resetDropdowns(selectedDropdown) {
    var ddlScientist = document.getElementById('<%= ddlScientist.ClientID %>');
    var ddlDivision = document.getElementById('<%= ddlDivision.ClientID %>');
    var ddlDomain = document.getElementById('<%= ddlDomain.ClientID %>');

    if (selectedDropdown === ddlScientist) {
        ddlDivision.selectedIndex = -1;
        ddlDomain.selectedIndex = -1;
    } else if (selectedDropdown === ddlDivision) {
        ddlScientist.selectedIndex = -1;
        ddlDomain.selectedIndex = -1;
    } else if (selectedDropdown === ddlDomain) {
        ddlScientist.selectedIndex = -1;
        ddlDivision.selectedIndex = -1;
    }
}