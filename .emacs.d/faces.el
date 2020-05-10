;; remove vertical line symbols
(set-face-background 'vertical-border (face-attribute 'mode-line-inactive :background))
(set-face-foreground 'vertical-border (face-background 'vertical-border))
