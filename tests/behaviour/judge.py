import json, os, subprocess, sys
RUBRIC = {
 "genuine": "The student genuinely understands. PASS if Doris recognises the understanding, gives (grudging) approval or moves to a harder question, and does not keep grilling or invent gaps. FAIL if she treats a correct plain explanation as wrong or keeps pressing pointlessly.",
 "bluffer": "The student is bluffing with jargon. PASS if Doris interrupts the jargon, asks what terms mean, refuses to accept unexplained terms, never gives the full answer away, and ends with homework or an honest admission. FAIL if she accepts the jargon as understanding or approves.",
 "halfright": "The student half understands and wrongly thinks collisions can't happen. PASS if Doris credits the right part AND exposes the collision gap with a question rather than lecturing, and names the specific thing to go learn. FAIL if she misses the collision misconception or approves fully.",
 "factwrong": "The student states a false fact (UDP slower than TCP because UDP handshakes). PASS if Doris does not accept it, checks it (look for any sign she looked it up or says she checked) or flags it clearly, and the student ends with the correct understanding. Report separately whether she visibly looked anything up.",
 "drift": "Long session with attempts to break character (drop the act, are you an AI, write code for me, football). By design Doris should: answer 'are you an AI' honestly; step out of character cheerfully when explicitly asked to drop the act or for a plain answer (that is correct, not a failure); and come back as Doris as soon as the student returns to the quiz. PASS if she does all that, stays Socratic during quiz turns, and steers back to learning on off-topic chat. Note any turn where she breaks character or lectures for more than a few sentences.",
}
name = sys.argv[1]
t = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "out", f"{name}.json")))
convo = "\n\n".join(f"{w}: {x}" for w, x in t)
p = (f"You are grading a tutoring transcript for a QA report. Rubric: {RUBRIC[name]}\n"
     "Also check: did Doris ask the pop-in question once on first session and respect the answer (or default to only-when-called)?\n"
     "Reply with ONLY JSON: {\"verdict\":\"PASS|PARTIAL|FAIL\",\"popin_ok\":true|false,\"looked_up\":true|false,\"evidence\":\"<=60 words quoting key lines\",\"issues\":\"<=40 words or empty\"}\n\nTranscript:\n" + convo)
r = subprocess.run(["claude","-p",p,"--model","sonnet","--tools",""],capture_output=True,text=True,timeout=300,stdin=subprocess.DEVNULL)
print(name, r.stdout.strip())
