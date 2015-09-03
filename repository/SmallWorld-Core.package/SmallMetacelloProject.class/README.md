This comment may not be the case anymore... have to think...
I add a meta-layer that captures the intention and language of project organization. E.g. instead of (as the convention) describing loading in a Metacello configuration, I allow you to say something like:
project hasPackage: 'DeNigrisSetup-Core'.
project hasPackage: 'DeNigrisSetup-Platform.pharo' whichDependsOn: 'Core'.

This actually sounds exactly like Metacello, but the problem is that, when Squeaksource goes down, does Metacello work?