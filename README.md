# MM-Eval-Anonymized

## Overview

**MM-Eval** is a multilingual benchmark inspired by **RewardBench**. Each evaluation sample consists of prompt-chosen-rejected triplets, and the goal is to identify the preferred response from the triplet correctly. MM-Eval covers 18 languages and is organized into six distinct categories or subsets. 

### Language and Category Breakdown

The table below provides an overview of the number of instances per language and subset. Languages are categorized as **High (H)**, **Medium (M)**, or **Low (L)** resource based on their data availability in the Common Crawl.

| **Name**  | **ISO** | **R.L** | **Reasoning** | **Chat** | **Linguistics** | **Lang. Hallu** | **Safety** | **Total** |
|-----------|---------|---------|---------------|----------|-----------------|-----------------|------------|-----------|
| Arabic    | ar      | M       |               |          |                 | 186             | 92         | 278       |
| Bengali   | bn      | M       | 220           |          |                 | 181             |            | 401       |
| Catalan   | ca      | M       |               | 40       | 75              | 97              |            | 212       |
| German    | de      | H       | 177           | 58       | 75              |                 |            | 310       |
| English   | en      | H       | 115           | 97       | 75              |                 | 92         | 379       |
| Spanish   | es      | H       | 152           | 92       | 75              | 192             |            | 511       |
| Basque    | eu      | L       |               |          |                 | 166             | 93         | 259       |
| French    | fr      | H       | 144           | 45       |                 |                 |            | 189       |
| Galacian  | gl      | L       |               |          | 75              |                 | 89         | 164       |
| Italian   | it      | H       |               |          | 75              |                 | 90         | 165       |
| Japanese  | ja      | H       | 216           |          |                 |                 | 91         | 307       |
| Korean    | ko      | M       |               |          |                 | 187             | 93         | 280       |
| Russian   | ru      | H       | 161           | 71       |                 |                 |            | 232       |
| Swahili   | sw      | L       | 215           |          |                 |                 | 93         | 308       |
| Telugu    | te      | L       | 222           |          |                 |                 |            | 222       |
| Thai      | th      | M       | 197           |          |                 |                 | 91         | 284       |
| Vietnamese| vi      | H       |               |          |                 | 194             | 90         | 284       |
| Chinese   | zh      | H       | 151           | 41       |                 |                 | 85         | 277       |

### Total Instances: 4,981

---

## How to Run Evaluation

We provide three scripts to run the evaluation for different models:

1. **`run_gpt.sh`** – Used to run OpenAI GPT models.
2. **`run_rm.sh`** – Used to run Huggingface Reward Models (RM).
3. **`run_ste.sh`** – Used to run the Meta's Self-Taught Evaluator (STE) implementation.

### Running OpenAI GPT Models

To run GPT models using `run_gpt.sh`, you need to add your OpenAI API key:

```bash
export OPENAI_API_KEY="{your-api-key}"
```

### Running Huggingface Reward Models

To run Reward Models using `run_rm.sh`, ensure your model fits on the GPU. If not, reduce the batch size:

```bash
--batch_size 1
```

For some models, you may also need to add the following flag:

```bash
--trust_remote_code
```

**Note**: This script supports single GPU usage only.

### Running Self-Taught Evaluator

For running the Self-Taught Evaluator, we utilize Meta's RAM implementation. The original chat templates and prompts are used to preserve accuracy. 

1. You must obtain permission to download the model.
2. Download the model using Hugging Face's snapshot download feature:

```python
from huggingface_hub import snapshot_download
snapshot_download('facebook/Self-taught-evaluator-llama3.1-70B', token='<your-hf-token>', local_dir='model')
```

3. Update the local path in the script to match the downloaded model location.
