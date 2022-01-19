import { annotate } from 'rough-notation';

const highlightText = () => {
  const e = document.querySelector('#highlight');
  const annotation = annotate(e, { type: 'highlight', animationDuration: 2000, padding: [2, 10], color: '#2f6f7b', iterations: 3});
  annotation.show();
};

export { highlightText };
