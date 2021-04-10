import 'package:flutter/material.dart';

class OptionTitle extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;
  OptionTitle(
      {@required this.option,
      @required this.optionSelected,
      @required this.correctAnswer,
      @required this.description});
  @override
  _OptionTitleState createState() => _OptionTitleState();
}

class _OptionTitleState extends State<OptionTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.description == widget.optionSelected
                      ? widget.optionSelected == widget.correctAnswer
                          ? Colors.green.withOpacity(0.7)
                          : Colors.red.withOpacity(0.7)
                      : Colors.grey),
            ),
            child: Text(
              '${widget.option}',
              style: TextStyle(
                color: widget.optionSelected == widget.description
                    ? widget.correctAnswer == widget.optionSelected
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.grey,
              ),
            ),
          ),
          Text(
            widget.description,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
