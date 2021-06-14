class AppButton extends RawMaterialButton {
  AppButton({
    @required VoidCallback onPressed,
    @required label,
    Color primaryColor,
    Color highlightColor,
    double height = 60,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.bold,
  }) : super(
            onPressed: onPressed,
            child: Container(
              padding: EdgeInsets.all(10),
              height: height,
              alignment: Alignment.center,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: primaryColor ?? ThemeUtils.primaryColor,
            highlightColor: primaryColor ?? ThemeUtils.primaryColor);
}
